import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
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

//StatefulWidget 无法定义状态 需要创建一个单独的类 来维护创建
class homeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeBodyState();
  }
}

//为什么在 state 内定义build 因为只有在state内 才能定义状态变量
// ignore: camel_case_types
class homeBodyState extends State<homeBody> {
  var flag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: flag,
              onChanged: (value) {
                print(value);
                setState(() {
                  flag = value as bool;
                });
              }),
          const Text(
            'hello',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
