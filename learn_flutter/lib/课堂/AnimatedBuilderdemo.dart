// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// ignore: unnecessary_import
import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:provider/provider.dart';

// ignore_for_file: avoid_print
EventBus eventBus = EventBus();

class UserInfo {
  String name;
  int age;
  UserInfo(this.name, this.age);
}

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? sizeAntion;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    final cvue = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);
    sizeAntion = Tween(begin: 50.0, end: 150.0).animate(cvue);
    // _controller!.addListener(() {
    //   setState(() {});
    // });
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build 开始构建了');
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            return Icon(
              Icons.favorite,
              color: Colors.red,
              size: sizeAntion!.value,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            if (_controller!.isAnimating) {
              _controller!.stop();
            } else if (_controller!.status == AnimationStatus.forward) {
              _controller!.forward();
            } else if (_controller!.status == AnimationStatus.reverse) {
              _controller!.reverse();
            } else {
              _controller!.forward();
            }
          }),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
