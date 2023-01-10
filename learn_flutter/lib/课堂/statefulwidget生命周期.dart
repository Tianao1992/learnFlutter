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

  homeContent(this.title) {
    print('homeContent调用构造函数');
  }
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    print('homeContent===createState');
    return _homepageState();
  }
}

// ignore: camel_case_types
class _homepageState extends State<homeContent> {
  int _count = 0;
  _homepageState() {
    print('_homepageState 构造函数');
  }
  @override
  void initState() {
    print('_homepageState initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //依赖发生改变
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('_homepageState build');
    return Column(
      children: [
        RaisedButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _count++;
              });
            }),
        Text('数字发生改变$_count')
      ],
    );
  }

  @override
  void dispose() {
    print('_homepageState dispose');
    super.dispose();
  }
}
