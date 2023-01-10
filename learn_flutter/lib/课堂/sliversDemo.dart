// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore: unnecessary_import
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

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('slive 列表'),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Color.fromARGB(150, 0, 0, 0),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('hello world'),
              background: Image.asset(
                'assets/images/time.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)));
              }, childCount: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2)),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext cxt, int index) {
            return ListTile(
              leading: Icon(Icons.pets),
              trailing: Icon(Icons.people),
              title: Text('联系人'),
            );
          }, childCount: 20))
        ],
      ),
    );
  }
}

class customScrollViewDemo1 extends StatelessWidget {
  const customScrollViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
            sliver: SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)));
              }, childCount: 100),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8)),
        ))
      ],
    );
  }
}
