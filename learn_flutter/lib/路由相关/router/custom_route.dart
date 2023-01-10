// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

class CustomeRotue extends PageRouteBuilder {
  final Widget customX;
  final int animat = 0;
  CustomeRotue(this.customX, {animat, dialog = false, setting})
      : super(
            fullscreenDialog: dialog,
            settings: setting,
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return customX;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return animateModel(animat, animation1, animation2, child);
            });
}

Widget animateModel(int model, Animation<double> animation1,
    Animation<double> animation2, Widget child) {
  switch (model) {
    case 1:
      //缩放动画
      return ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
        child: child,
      );
      break;
    case 2:
      //旋转加缩放
      return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
        child: ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
          child: child,
        ),
      );
      break;
    case 3:
      //左侧滑动进入退出
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
            CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
        child: child,
      );
      break;
    default:
      //渐隐渐现过渡效果
      return FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animation1,
          curve: Curves.fastOutSlowIn, //动画曲线
        )),
        child: child,
      );
  }
}
