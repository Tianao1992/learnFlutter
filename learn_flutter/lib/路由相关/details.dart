// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/路由相关/detail2.dart';

class HomeDetailPage extends StatefulWidget {
  static final String routeName = "/details";

  String message = "";
  HomeDetailPage(this.message);

  @override
  State<StatefulWidget> createState() {
    return _HomeDetailPageState();
  }
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
        leading: IconButton(
            onPressed: () => _popHome(context), icon: Icon(Icons.ac_unit)),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.message,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  child: Text('返回首页'), onPressed: () => _popHome(context)),
              ElevatedButton(
                  child: Text("跳转下级"), onPressed: () => _jumpDetail2(context)),
            ],
          ),
        ),
      ),
    );
  }

  void _jumpDetail2(BuildContext context) {
    Navigator.of(context).pushNamed(HDetail2Page.routeName);
  }

  void _popHome(BuildContext cxt) {
    Navigator.of(cxt).pop('返回给首页的数据');
  }
}
