// ignore_for_file: deprecated_member_use

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('1234'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

  //图片默认缓存 1000张 最大100M
  final imageURl =
      'https://img2.baidu.com/it/u=1113804529,155359060&fm=253&fmt=auto&app=138&f=JPEG?w=300&h=500';
  Widget build(BuildContext context) {
    // return const Image(image: AssetImage('assets/images/time.jpeg'));
    return FadeInImage(
        fadeInDuration: Duration(milliseconds: 1),
        placeholder: AssetImage('assets/images/time.jpeg'),
        image: NetworkImage(imageURl));
  }
}

class imgNetWorkDemo extends StatelessWidget {
  const imgNetWorkDemo({
    Key? key,
    required this.imageURl,
  }) : super(key: key);

  final String imageURl;

  @override
  Widget build(BuildContext context) {
    return Image(
        image: NetworkImage(imageURl),
        width: 100,
        height: 300,
        fit: BoxFit.fitWidth,
        // alignment: Alignment(-1, 1),
        repeat: ImageRepeat.repeatY);
  }
}
