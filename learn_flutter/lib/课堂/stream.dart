// ignore_for_file: dead_code

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  Future.delayed(Duration.zero, () => print("event1"));

  scheduleMicrotask(() => {print("microtask1")});
  Future.microtask(() => {print("microtask2")});
  Future.value(1234).then(
    (value) {
      print("microtask3");
    },
  );

  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stream 流',
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

// final stream = Strea m.periodic(Duration(seconds: 1), (_) => 42);

final controller = StreamController();

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    controller.close();
  }

  @override
  void initState() {
    // stream.listen((event) {
    //   print("stream: $event");
    // });
    // File("").openRead();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("1342143")),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                print("外部123432");
              },
              child: ElevatedButton(
                  onPressed: () {
                    print("内部响应");
                  },
                  child: Text("1234")),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.sink.add(10);
                },
                child: Text("10")),
            ElevatedButton(
                onPressed: () {
                  controller.sink.add("hi");
                },
                child: Text("hi")),
            ElevatedButton(
                onPressed: () {
                  controller.close();
                },
                child: Text("关闭")),
            StreamBuilder(
              stream: controller.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("没有数据流");
                    break;
                  case ConnectionState.waiting:
                    return Text("等待数据流");
                    break;
                  case ConnectionState.active:
                    if (snapshot.hasError) {
                      return Text("有错误");
                    } else {
                      return Text("正常${snapshot.data}");
                    }
                    break;
                  case ConnectionState.done:
                    return Text("数据流关闭");
                    break;
                }
                return Container();
              },
            ),
          ],
        ));
  }
}
