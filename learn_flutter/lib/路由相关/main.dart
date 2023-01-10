import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:learn_flutter/%E8%AF%BE%E5%A0%82/webView_test.dart';
import 'package:learn_flutter/路由相关/about.dart';
import 'package:learn_flutter/路由相关/details.dart';
import 'package:learn_flutter/路由相关/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //不加这个强制横/竖屏会报错
  SystemChrome.setPreferredOrientations([
    // 强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: TRouter.routes,
      initialRoute: TRouter.initialRoute,
      onGenerateRoute: TRouter.generateRoute,
      onUnknownRoute: TRouter.unknownRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static final String routeName = "/";

  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String msg = "首页";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              msg,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                child: Text('跳转详情'), onPressed: () => _clickPush(context)),
            ElevatedButton(
                child: Text('跳转关于'), onPressed: () => _clickPushAbout(context)),
            ElevatedButton(
                child: Text('跳转错误页面'),
                onPressed: () => _clickPushError(context)),
            ElevatedButton(
                onPressed: () => _clickPushWwebPage(context),
                child: Text("跳转网页"))
            // ElevatedButton(
            //     child: Text('点击横屏'),
            //     onPressed: () {
            //       SystemChrome.setPreferredOrientations([
            //         DeviceOrientation.landscapeLeft,
            //         DeviceOrientation.landscapeRight
            //       ]);
            //     }),
            // ElevatedButton(
            //     child: Text('点击回竖屏'),
            //     onPressed: () {
            //       SystemChrome.setPreferredOrientations([
            //         DeviceOrientation.portraitUp,
            //         DeviceOrientation.portraitDown
            //       ]);
            //     })
          ],
        ),
      ),
    );
  }

  void _clickPush(BuildContext context) {
    // 强制横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    final future = Navigator.of(context).push(MaterialPageRoute(builder: (cx) {
      return HomeDetailPage("这是首页的数据");
    }));

    future.then((message) {
      setState(() {
        msg = message;
      });
    });
  }

  void _clickPushAbout(BuildContext context) {
    Navigator.of(context).pushNamed(HomeAbount.routeName, arguments: "首页跳关于");
  }

  void _clickPushError(BuildContext context) {
    Navigator.of(context).pushNamed('/settring');
  }

  void _clickPushWwebPage(BuildContext context) {
    Navigator.of(context).pushNamed(WebViewPage.routeName);
  }
}
