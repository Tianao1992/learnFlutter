import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  static String routeName = "/webViewPage";
  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;
  String _title = "webview";

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  Future<void> _loadHtmlFromAsset() async {
    final String path = await rootBundle.loadString('assets/testweb.html');
    _controller.loadUrl(Uri.dataFromString(path,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SafeArea(
          child: WebView(
              // initialUrl: "https://flutter.dev",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
                _loadHtmlFromAsset();
              },
              onProgress: (int progress) {
                print('WebView is loading (progress : $progress%)');
              },
              onPageFinished: (url) async {
                //调用JS方法，获取页面的标题
                String title = await _controller
                    .runJavascriptReturningResult('document.title');
                setState(() {
                  _title = title;
                });
                evaluateJavascript();
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  print('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              javascriptChannels: <JavascriptChannel>{
            //js 调用flutter
            _toasterJavascriptChannel(context),
          })),
    );
  }

  Future<void> evaluateJavascript() async {
    print('evaluateJavascript');
    //这个是实现了Flutter控制了H5页面文本的显示
    _controller.runJavascript("callJS('visible')");
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          print("参数： ${message.message}");
          //实际应用中要通过map通过key获取
          // String callbackname = message.message;
          // String data = "收到消息调用了";
          // String script = "$callbackname($data)";
          // _controller.runJavascript(script);
        });
  }
}
