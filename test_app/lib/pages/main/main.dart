import 'package:flutter/material.dart';
import 'init_bottom_items.dart';

class MyMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyMainPageState();
  }
}

class _MyMainPageState extends State<MyMainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
