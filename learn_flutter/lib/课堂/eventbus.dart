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
      home: Scaffold(
        appBar: AppBar(
          title: Text('网络请求'),
        ),
        body: homeContent(),
        //相比于 consumre  Selector 方法不重新 build
      ),
    );
  }
}

class homeContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [btnWidget(), TextWiget()],
        ),
      ),
    );
  }
}

class btnWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.red,
      child: Text(
        '打印',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        UserInfo info = UserInfo('hahah', 20);
        eventBus.fire(info);
      },
    );
  }
}

class TextWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextWigetState();
  }
}

class _TextWigetState extends State<TextWiget> {
  var msg = "hello world";
  @override
  void initState() {
    eventBus.on<UserInfo>().listen((event) {
      setState(() {
        msg = '${event.name}---${event.age}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        msg,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class stackDemo extends StatelessWidget {
  const stackDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTapDown: ((details) {
            print('outer click');
          }),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
          ),
        ),
        GestureDetector(
          onTapDown: ((details) {
            print('inner click');
          }),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapUp: (detatil) {
        print(detatil.globalPosition);
        print(detatil.localPosition);
      },
      child: Container(
        color: Colors.red,
        width: 200,
        height: 200,
      ),
    );
  }
}
