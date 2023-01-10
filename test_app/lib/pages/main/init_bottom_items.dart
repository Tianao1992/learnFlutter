import 'bottom_bar_item.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';
import '../subject/my_subject.dart';

//抽取
List<TBottomBarItem> items = [
  TBottomBarItem("home", "首页"),
  TBottomBarItem("subject", "影音"),
  TBottomBarItem("group", "分组"),
  TBottomBarItem("mall", "市集"),
  TBottomBarItem("profile", "我的"),
];
List<Widget> pages = [
  HomePage(),
  MySubject(),
  MySubject(),
  MySubject(),
  MySubject(),
];
