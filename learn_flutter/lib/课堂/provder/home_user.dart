import 'package:flutter/material.dart';
import 'model.dart';

class UserProvider extends ChangeNotifier {
  UserInfo _user;

  UserProvider(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}
