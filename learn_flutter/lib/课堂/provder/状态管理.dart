// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// ignore: unnecessary_import
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:provider/provider.dart';
import 'model.dart';
import 'home_vm.dart';
import 'home_user.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext cxt) {
        return HomeVM();
      }),
      ChangeNotifierProvider(
          create: (ctx) => UserProvider(UserInfo('why', 20))),
    ],
    child: myApp(),
  ));
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('网络请求'),
          ),
          body: homeContent(),
          //相比于 consumre  Selector 方法不重新 build
          floatingActionButton: Selector<HomeVM, HomeVM>(
            selector: (cxt, homv) => homv,
            shouldRebuild: (pre, next) => false,
            child: Icon(Icons.add),
            builder: ((context, homv, child) {
              return FloatingActionButton(
                  child: child,
                  onPressed: () {
                    homv.age += 1;
                    homv.counter += 1;
                  });
            }),
          )),
    );
  }
}

class homeContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_HomeData1(), _HomeData2(), _HomeData3()],
      ),
    );
  }
}

class _HomeData1 extends StatelessWidget {
  Widget build(BuildContext context) {
    int counter = Provider.of<HomeVM>(context).counter;
    print("data01的build方法");
    return Container(
      color: Colors.red,
      child: Text(
        '计数$counter',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class _HomeData2 extends StatelessWidget {
  Widget build(BuildContext context) {
    print("data02的build方法");
    return Container(
      color: Colors.blue,
      child: Consumer<HomeVM>(
        builder: ((context, homv, child) {
          return Text(
            '计数${homv.age}',
            style: TextStyle(fontSize: 20),
          );
        }),
      ),
    );
  }
}

class _HomeData3 extends StatelessWidget {
  Widget build(BuildContext context) {
    print("data03的build方法");
    return Container(
      color: Colors.green,
      child: Consumer2<HomeVM, UserProvider>(
        builder: ((context, homev, userV, child) {
          return Text('${userV.user.nickname}计数 ${homev.counter}',
              style: TextStyle(fontSize: 20));
        }),
      ),
    );
  }
}
