import 'package:flutter/foundation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:learn_flutter/getx_learn/main.dart';

class TTRouter {
  static List<GetPage> pages = [
    GetPage(name: MyHomePage.routeName, page: () => MyHomePage()),
    GetPage(name: about.routeName, page: () => about()),
    GetPage(name: user.routeName, page: () => user()),
  ];
  static final ValueChanged<Routing?>? callback = (routing) {
    if (routing!.current == user.routeName) {}
  };
}
