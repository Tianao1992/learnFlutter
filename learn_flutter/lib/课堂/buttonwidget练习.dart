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
  Widget build(BuildContext context) {
    return raiseBtnDemo();
  }
}

class raiseBtnDemo extends StatelessWidget {
  const raiseBtnDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RaisedButton(
            child: const Text('raisebtn'),
            textColor: Colors.red,
            onPressed: () => {print('打印')}),
        FlatButton(child: const Text('flatBtn'), onPressed: () => print('打印')),
        //自定义button
        FlatButton(
            color: Colors.amberAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text('喜欢坐着')
              ],
            ))
      ],
    );
  }
}

// ignore: camel_case_types
class btnDemo extends StatelessWidget {
  const btnDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //默认情况下有间距
        //btn有默认大小
        //btn 内间距问题
        ButtonTheme(
            minWidth: 10,
            height: 30,
            padding: EdgeInsets.zero,
            child: FlatButton(
                onPressed: () => {},
                color: Colors.red,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textColor: Colors.white,
                child: const Text(
                  'werwerwrw',
                  style: TextStyle(fontSize: 15),
                ))),
        FlatButton(
            onPressed: () => {},
            color: Colors.red,
            textColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: const Text('btn2 text'))
      ],
    );
  }
}
