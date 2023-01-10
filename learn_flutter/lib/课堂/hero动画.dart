// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// ignore: unnecessary_import
import 'dart:developer';
import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/ImageDetailPage.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('转场动画'),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2),
      children: List.generate(20, (index) {
        String imageURL = "https://picsum.photos/id/$index/400/200";

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: ((context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: HYImageDetailPage(imageURL),
              );
            })));
          },
          child: Hero(
            tag: imageURL,
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}
