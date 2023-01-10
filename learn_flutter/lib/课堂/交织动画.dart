// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// ignore: unnecessary_import
import 'dart:developer';
import 'dart:math';

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
  Animation? colorAm;
  Animation? opacityAm;
  Animation? _radiansAnim;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    // final cvue = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);
    sizeAntion = Tween(begin: 10.0, end: 200.0).animate(_controller!);
    colorAm = ColorTween(begin: Colors.orange, end: Colors.pink)
        .animate(_controller!);
    opacityAm = Tween(begin: 0.0, end: 1.0).animate(_controller!);

    _radiansAnim = Matrix4Tween(
            begin: Matrix4.rotationZ(0.0), end: Matrix4.rotationZ(pi / 4))
        .animate(_controller!);

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
          builder: (cxt, child) {
            return Opacity(
              opacity: opacityAm!.value,
              child: Transform(
                transform: _radiansAnim!.value,
                alignment: Alignment.center,
                child: Container(
                  width: sizeAntion!.value,
                  height: sizeAntion!.value,
                  color: colorAm!.value,
                ),
              ),
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
