// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, annotate_overrides, must_call_super

// ignore: unnecessary_import

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/ImageDetailPage.dart';
import 'package:learn_flutter/appTheme.dart';
import 'package:learn_flutter/language/localia_view_model.dart';
import 'package:learn_flutter/language/localizations.dart';
import 'package:learn_flutter/language/localizations_delegate.dart';
import 'package:learn_flutter/widgets/chat_list_scroll_demo_page_2.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return LocaliVM();
        })
      ],
      child: Consumer<LocaliVM>(builder: (context, localvm, child) {
        print('刷新');
        return myApp(localvm.locale);
      }),
    ),
  );
}

class myApp extends StatelessWidget {
  final Locale locale;
  myApp(this.locale);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: locale,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("首页")), body: Container());
  }

  void changeLanguage(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('切换语言'),
            children: [simple('中文'), simple('英文')],
          );
        });
  }

  Widget simple(String str) {
    return Consumer<LocaliVM>(
      builder: ((context, localVM, child) {
        return SimpleDialogOption(
          child: Text(str),
          onPressed: () {
            if (str == "英文") {
              localVM.locale = Locale('en', "zh");
            } else {
              localVM.locale = Locale('zh', "en");
            }
            Navigator.pop(context);
          },
        );
      }),
    );
  }
}
