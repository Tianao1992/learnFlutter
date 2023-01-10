import 'package:flutter/material.dart';

class TBottomBarItem extends BottomNavigationBarItem {
  TBottomBarItem(String iconNmae, String title)
      : super(
          label: title,
          icon: Image.asset("assets/images/tabbar/$iconNmae.png",
              width: 32, gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/tabbar/${iconNmae}_active.png",
              width: 32, gaplessPlayback: true),
        );
}
