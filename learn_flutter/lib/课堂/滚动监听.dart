// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore: unnecessary_import
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  ScrollController cn = ScrollController(initialScrollOffset: 300);
  bool _isShowFloating = false;

  @override
  void initState() {
    super.initState();
    /*
    * ScrollController 可以监听滚动
    * 1. 可以设置offset
    * 2。 可以监听滚动的位置
    * 3 无法监听开始滚动
    */
    cn.addListener(() {
      // print('滚动 ${cn.offset}');
      setState(() {
        _isShowFloating = cn.offset >= 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scrollDemo(cn: cn),
      floatingActionButton: _isShowFloating
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                cn.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.easeIn);
              })
          : null,
    );
  }
}

class scrollDemo extends StatelessWidget {
  const scrollDemo({
    Key? key,
    required this.cn,
  }) : super(key: key);

  final ScrollController cn;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          print('开始滚动');
        } else if (notification is ScrollUpdateNotification) {
          print(
              '正在滚动 总距离${notification.metrics.maxScrollExtent} 当前滚动位置${notification.metrics.pixels}');
        } else if (notification is ScrollEndNotification) {
          print('结束滚动');
        }
        return true;
      },
      child: ListView(
        controller: cn,
        children: List.generate(100, (index) {
          return ListTile(
            leading: Icon(Icons.pets),
            trailing: Icon(Icons.people),
            title: Text('联系人 $index'),
          );
        }),
      ),
    );
  }
}
