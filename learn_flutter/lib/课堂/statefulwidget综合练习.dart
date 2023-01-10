// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/material/raised_button.dart';

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
        title: const Text('列表'),
      ),
      body: homeContent('传递数据'),
    );
  }
}

class homeContent extends StatefulWidget {
  final String title;
  homeContent(this.title);
  @override
  State<StatefulWidget> createState() {
    return _homepageState();
  }
}

/**
 *  build方法为什么要放在state 
 *  1 build出来的widget需要依赖state方法中的变量
 *  2 在flutter运行过程中widget在不断的销毁创建 
 *  3 当我们状态发生改变时并不希望state 重新创建
*/
// ignore: camel_case_types
class _homepageState extends State<homeContent> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButtons(),
          Text('当前计数器:$_count',
              style: const TextStyle(
                fontSize: 20,
              )),
          Text("父类传过类对象:${widget.title}"),
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            child: const Text('+',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            color: Colors.pink,
            onPressed: () {
              setState(() {
                _count++;
              });
            }),
        RaisedButton(
            child: const Text('-',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            color: Colors.purple,
            onPressed: () {
              setState(() {
                if (_count > 0) {
                  _count--;
                }
              });
            }),
      ],
    );
  }
}
