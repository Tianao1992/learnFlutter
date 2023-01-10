import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late EasyRefreshController _controller;
  // 条目总数
  int _count = 0;
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('刷新demo')),
        body: EasyRefresh(
            controller: _controller,
            // firstRefresh: true,
            header: ClassicalHeader(infoText: '刷新拉'),
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2), () {
                print('onRefresh');
                setState(() {
                  _count = 20;
                });
                _controller.resetLoadState();
              });
            },
            onLoad: () async {},
            child: ListView.builder(
                itemCount: _count,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                    leading: Icon(Icons.pedal_bike),
                  );
                })));
  }
}
