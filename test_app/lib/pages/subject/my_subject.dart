import 'package:flutter/material.dart';
import 'subject_content.dart';

class MySubject extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试页'),
      ),
      body: subContent(),
    );
  }
}
