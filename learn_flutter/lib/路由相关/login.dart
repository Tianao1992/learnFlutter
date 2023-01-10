// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:learn_flutter/路由相关/about.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: LoginPageContent(),
    );
  }
}

class LoginPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageContentState();
  }
}

class _LoginPageContentState extends State<LoginPageContent> {
  @override
  final usernameVc = TextEditingController();
  final passwordVc = TextEditingController();

  Widget build(BuildContext context) {
    return Center(
      child: textWidget(usernameVc: usernameVc, passwordVc: passwordVc),
    );
  }
}

class textWidget extends StatelessWidget {
  const textWidget({
    Key? key,
    required this.usernameVc,
    required this.passwordVc,
  }) : super(key: key);

  final TextEditingController usernameVc;
  final TextEditingController passwordVc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameVc,
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                hintText: "请输入用户名",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordVc,
            decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: "请输入密码",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  submitted(context);
                },
                child: Text(
                  "登录",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  void submitted(BuildContext context) {
    final name = usernameVc.text;
    final password = passwordVc.text;
    print('$name 账号 $password 密码');
    passwordVc.text = '';
    usernameVc.text = '';
    Navigator.popAndPushNamed(context, HomeAbount.routeName, arguments: "首页关于");
    // Navigator.of(context).pushNamed(HomeAbount.routeName, arguments: "shouye");
  }
}
