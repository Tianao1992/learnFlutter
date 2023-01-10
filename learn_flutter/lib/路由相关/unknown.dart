import 'package:flutter/material.dart';

class HUnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页面"),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Text(
          "错误页面",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}
