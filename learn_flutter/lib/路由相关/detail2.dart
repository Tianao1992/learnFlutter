import 'package:flutter/material.dart';

class HDetail2Page extends StatelessWidget {
  static String routeName = "/detail2";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页2'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('三级页面'),
              ElevatedButton(
                child: Text("上级"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
