import 'package:flutter/material.dart';
import 'model.dart';

class HomeVM extends ChangeNotifier {
  int _counter = 100;

  int _age = 10;

  int get counter {
    return _counter;
  }

  int get age {
    return _age;
  }

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  set age(int value) {
    _age = value;
    notifyListeners();
  }
}
