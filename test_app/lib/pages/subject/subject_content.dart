import 'package:flutter/material.dart';

class subContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _subContentState();
  }
}

class _subContentState extends State<subContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('测试页'),
    );
  }
}
