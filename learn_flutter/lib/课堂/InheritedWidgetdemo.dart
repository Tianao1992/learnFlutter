// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// ignore: unnecessary_import
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(myApp());
}

class HYDataWidget extends InheritedWidget {
  //共享的数据
  final int counter;
  //构造方法
  HYDataWidget({required this.counter, required Widget child})
      : super(child: child);
  //获取祖先最近的widget
  static HYDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(HYDataWidget oldWidget) {
    return this.counter != oldWidget.counter;
  }
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('网络请求'),
          ),
          body: homeContent()),
    );
  }
}

class homeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: HYDataWidget(
      counter: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [HomeStae1(), HomeStae2()],
      ),
    ));
  }
}

class HomeStae1 extends StatelessWidget {
  Widget build(BuildContext context) {
    final int counter = HYDataWidget.of(context)!.counter;
    return Card(
      color: Colors.red,
      child: Text('计数 $counter'),
    );
  }
}

class HomeStae2 extends StatelessWidget {
  Widget build(BuildContext context) {
    final int counter = HYDataWidget.of(context)!.counter;
    return Container(
      color: Colors.blue,
      child: Text('计数 $counter'),
    );
  }
}
