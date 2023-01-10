import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试demo',
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
  List<String> names = ["aaa", "bbb", "ccc"];

  @override
  Widget build(BuildContext context) {
    print("执行了");
    return Scaffold(
      appBar: AppBar(title: Text("test key")),
      body: ListView(
        children: names.map((name) {
          return ListItemFul(name, key: ValueKey(name));
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

// class ListItemLess extends StatelessWidget {
//   late final String name;
//   ListItemLess(this.name);
//   final Color color = Color.fromARGB(
//       255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       child: Text(name),
//       color: color,
//     );
//   }
// }

class ListItemFul extends StatefulWidget {
  final String name;
  ListItemFul(this.name, {Key? key}) : super(key: key);
  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    print('ListItemFul state 执行');
    return Container(
      height: 60,
      child: Text(widget.name),
      color: randomColor,
    );
  }
}
