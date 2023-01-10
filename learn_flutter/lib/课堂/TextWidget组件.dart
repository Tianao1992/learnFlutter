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
        body: homeContent());
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
    return TextRichDemo();
  }
}

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text.rich(TextSpan(
          children: [
            TextSpan(
                text: 'hello world',
                style: TextStyle(fontSize: 20, color: Colors.red)),
            TextSpan(
                text: 'sss',
                style: TextStyle(fontSize: 30, color: Colors.blue)),
            WidgetSpan(
                child: Image(
              image: AssetImage('assets/images/time.jpeg'),
              fit: BoxFit.cover,
            )),
            TextSpan(
                text: 'mmmmm',
                style: TextStyle(fontSize: 10, color: Colors.pink))
          ],
        )),
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}
