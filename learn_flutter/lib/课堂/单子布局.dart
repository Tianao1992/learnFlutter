// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

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

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文本widget'),
      ),
      body: homeContent(),
    );
  }
}

class homeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homeConetentState();
  }
}

class _homeConetentState extends State<homeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment(0, 0),
      width: 200,
      height: 200,
      // transform: Matrix4.rotationX(200),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(width: 5, color: Colors.pink),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(10, 10),
                spreadRadius: 5,
                blurRadius: 100)
          ],
          borderRadius: BorderRadius.circular(100)),
      child: Text('123412341234'),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          '你好呀',
          style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
        ));
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key? key,
  }) : super(key: key);

  @override
  //单子组件
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-1, -1),
      child: Icon(
        Icons.pets,
        size: 50,
      ),
    );
  }
}
