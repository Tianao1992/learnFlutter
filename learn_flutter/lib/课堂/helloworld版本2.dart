import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

// ignore: slash_for_doc_comments
/**
 * 有状态widget: 有数据改变 运行过程中一些状态data需要改变
 * 无状态widget： 无数据改变
*/

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: homePage());
  }
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //脚手架
      appBar: AppBar(
        title: const Text('第一个flutter程序'),
      ),
      body: homeBody(),
    );
  }
}

class homeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'hello world',
        style: TextStyle(fontSize: 30, color: Colors.red),
      ),
    );
  }
}
