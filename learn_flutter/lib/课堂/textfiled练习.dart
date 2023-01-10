// ignore_for_file: deprecated_member_use, prefer_const_constructors

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
  @override
  final usernameVc = TextEditingController();
  final passwordVc = TextEditingController();

  Widget build(BuildContext context) {
    return TextFiled(usernameVc: usernameVc, passwordVc: passwordVc);
  }
}

class TextFiled extends StatelessWidget {
  const TextFiled({
    Key? key,
    required this.usernameVc,
    required this.passwordVc,
  }) : super(key: key);

  final TextEditingController usernameVc;
  final TextEditingController passwordVc;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: usernameVc,
                decoration: const InputDecoration(
                    icon: Icon(Icons.add),
                    hintText: '请输入用户名',
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  print(value);
                },
                onSubmitted: (value) {
                  print(value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordVc,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 200,
                height: 40,
                child: FlatButton(
                  onPressed: () {
                    final name = usernameVc.text;
                    final password = passwordVc.text;
                    print('$name 账号 $password 密码');
                    passwordVc.text = '';
                    usernameVc.text = '';
                  },
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }
}
