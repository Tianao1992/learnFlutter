// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

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
        title: const Text('文本widget'),
      ),
      body: homeContent(),
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
    // 当前屏幕的宽度 MediaQuery.of(context).size
    /*
    *  StackFit.expand 拉伸 
    *  Positioned 调整子元素定位
    */
    return Stack(
      children: [
        Image.asset(
          "assets/images/time.jpeg",
          width: 414,
          repeat: ImageRepeat.repeat,
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Color.fromARGB(150, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '测试试',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _isFave = !_isFave;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _isFave == true ? Colors.red : Colors.white,
                      ))
                ],
              ),
            ))
      ],
    );
  }
}

class StackDemo1 extends StatelessWidget {
  const StackDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      overflow: Overflow.visible,
      children: [
        Container(
          width: 350,
          height: 100,
          color: Colors.red,
        ),
        Image.asset("assets/images/time.jpeg"),
        Positioned(
            right: 10,
            child: Text(
              '来吧来吧',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ))
      ],
    );
  }
}

class expandedDemo extends StatelessWidget {
  const expandedDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /*
         *Flexible 空间分配  flex分配优先级
         *Expanded -> flexible  FlexFit.tight 空间分配及收缩
        */
        Expanded(
            flex: 1,
            child: Container(
              width: 200,
              height: 60,
              color: Colors.red,
            )),
        Expanded(
            flex: 1,
            child: Container(
              width: 100,
              height: 60,
              color: Colors.black,
            )),
        Container(
          width: 50,
          height: 60,
          color: Colors.blue,
        ),
        Container(
          width: 200,
          height: 60,
          color: Colors.pink,
        )
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  /*
     *flex布局 
     * *
     * Row 主要方向 水平方向   交叉轴 垂直方向
     * Column 主轴方向 垂直方向  交叉轴 水平方向
     * spaceBetween 左右两边间距为0 其他平分
     * spaceAround 左右间距是中间间距的一半
     * spaceEvenly 平分间距
     * 
     * CrossAxisAlignment 交叉轴 
     * baseline 基线(必须有文本)
     * 
     * Row 的特点
     * 水平方向尽量占据大的展示空间
     * 垂直方向包裹内容
    */
  const RowDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.ideographic,
        children: [
          Container(
            width: 80,
            height: 60,
            color: Colors.red,
            child: Text(
              'hello',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
              width: 100,
              height: 80,
              color: Colors.green,
              child: Text(
                'hello ',
                style: TextStyle(fontSize: 20),
              )),
          Container(
              width: 50,
              height: 60,
              color: Colors.blue,
              child: Text(
                ' word',
                style: TextStyle(fontSize: 30),
              )),
          Container(
              width: 120,
              height: 60,
              color: Colors.pink,
              child: Text(
                'xx',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}

class BtnRowDemo extends StatelessWidget {
  const BtnRowDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text("按钮"), Icon(Icons.pets)],
        ),
        onPressed: () {});
  }
}
