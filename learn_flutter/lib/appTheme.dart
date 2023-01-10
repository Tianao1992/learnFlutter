// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    textTheme:
        TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.white)),
  );
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme:
        TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.white)),
  );
}
