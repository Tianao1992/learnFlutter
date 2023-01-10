// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore: unnecessary_import
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
      appBar: AppBar(
        title: const Text('滚动列表'),
      ),
      body: ListViewDemo2(),
    );
  }
}

class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          return Text('hello world $index');
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return Divider(
            color: Colors.red,
            height: 30,
            indent: 30,
            endIndent: 30,
            thickness: 10,
          );
        },
        itemCount: 100);
  }
}

class ListViewDemo3 extends StatelessWidget {
  const ListViewDemo3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 60,
      itemBuilder: (BuildContext ctx, int index) {
        return Text('hello world $index');
      },
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      // itemExtent: 100,
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.pets),
          trailing: Icon(Icons.people),
          title: Text('联系人 $index'),
        );
      }),
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
  bool _isFave = true;
  @override
  Widget build(BuildContext context) {
    return Text('123434');
  }
}
