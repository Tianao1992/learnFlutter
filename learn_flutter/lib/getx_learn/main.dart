import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/%E8%B7%AF%E7%94%B1%E7%9B%B8%E5%85%B3/router/router.dart';
import 'package:learn_flutter/getx_learn/Controller/controller.dart';
import 'package:learn_flutter/getx_learn/router/route.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '测试demo',
      initialRoute: '/',
      getPages: TTRouter.pages,
      routingCallback: TTRouter.callback,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String routeName = '/';
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    c.user.value = User('lisi', 30);
                  },
                  child: Text('跳转')),
              ElevatedButton(
                  onPressed: () {
                    c.count++;
                  },
                  child: Text('add')),
              Obx(() {
                return Text("${c.user.value.name}");
              }),
            ],
          ),
        ));
  }
}

class about extends StatelessWidget {
  static String routeName = '/about';
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(' 关于'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text("${c.count}");
            }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  c.count++;
                },
                child: Text('c++'))
          ],
        ),
        color: Colors.red,
      ),
    );
  }
}

class user extends StatelessWidget {
  static String routeName = '/user/:id';
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('用户'),
      ),
      body: Container(
        child: Text('用户'),
        color: Colors.red,
      ),
    );
  }
}
