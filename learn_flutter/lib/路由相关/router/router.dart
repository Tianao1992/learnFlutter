// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:learn_flutter/%E8%AF%BE%E5%A0%82/webView_test.dart';
import 'package:learn_flutter/路由相关/about.dart';
import 'package:learn_flutter/路由相关/detail2.dart';
import 'package:learn_flutter/路由相关/details.dart';
import 'package:learn_flutter/路由相关/login.dart';
import 'package:learn_flutter/路由相关/main.dart';
import 'package:learn_flutter/路由相关//router/custom_route.dart';
import 'package:learn_flutter/路由相关//unknown.dart';

class TRouter {
  static bool isPushAbout = false;

  static final Map<String, WidgetBuilder> routes = {
    // HomeAbount.routeName: (context) => HomeAbount(),
    MyHomePage.routeName: (context) => MyHomePage(),
    HDetail2Page.routeName: (context) => HDetail2Page(),
    WebViewPage.routeName: (context) => WebViewPage()
  };

  static final String initialRoute = MyHomePage.routeName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == HomeDetailPage.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return HomeDetailPage(settings.arguments as String);
        },
      );
    } else if (settings.name == HomeAbount.routeName) {
      if (isPushAbout == false) {
        return MaterialPageRoute(builder: (context) {
          isPushAbout = true;
          return LoginPage();
        });
        // return CustomeRotue(LoginPage(), animat: 1)
      } else {
        return MaterialPageRoute(
            builder: (context) {
              return HomeAbount();
            },
            settings: settings);
      }
    }
    return null;
  };

  static final RouteFactory unknownRoute = ((settings) {
    return MaterialPageRoute(
      builder: (context) {
        return HUnknownPage();
      },
    );
  });
}
