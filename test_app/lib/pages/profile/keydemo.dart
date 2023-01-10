// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePagState();
  }
}

class _HomePagState extends State<HomePage> {
  List names = ["aaa", "bbb", "ccc"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("key 测试"),
      ),
      body: ListView(
        children: names.map((e) {
          return HomelistItme(
            e,
            key: UniqueKey(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class HomelistItme extends StatefulWidget {
  final String name;
  HomelistItme(this.name, {Key? key}) : super(key: key);

  @override
  State<HomelistItme> createState() => _HomelistItmeState();
}

class _HomelistItmeState extends State<HomelistItme> {
  final Color color = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name),
      height: 60,
      color: color,
    );
  }
}
