import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAbount extends StatelessWidget {
  static String routeName = "/about";

  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('关于页面'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(message),
              ElevatedButton(
                child: Text("返回首页"),
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
