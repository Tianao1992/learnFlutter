import 'package:flutter/material.dart';

class LocaliVM extends ChangeNotifier {
  Locale _locale = Locale('zh', "en");

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}
