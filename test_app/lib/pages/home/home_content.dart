// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:test_app/network/home_requset.dart';
import 'package:test_app/pages/home/home_move_item.dart';
import 'package:test_app/pages/model/home_model.dart';

class homeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homeContentState();
  }
}

class _homeContentState extends State<homeContent> {
  List<MovieItem> moveis = [];

  @override
  void initState() {
    super.initState();
    HomeRquest.requsetMoveList().then((res) {
      setState(() {
        moveis.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (cxt, index) {
          return HomeMovieItem(moveis[index]);
        },
        itemCount: moveis.length);
  }
}
