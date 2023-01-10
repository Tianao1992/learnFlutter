// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试demo',
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
    return Scaffold(
        appBar: AppBar(title: Text("测试")),
        body: Container(
          color: Colors.orange,
          child: myRenderBox(
            distance: 13,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        )
        // body: CustomMultiChildLayout(
        //   delegate: myDelegate(),
        //   children: [
        //     // LayoutId(id: 1, child: FlutterLogo()),
        //     // LayoutId(id: 2, child: FlutterLogo()
        //     LayoutId(
        //         id: "line",
        //         child: Container(
        //           color: Colors.red,
        //         )),
        //     LayoutId(id: "text", child: Text("1345678")),
        //   ],
        // )
        );
  }
}

class myDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // var size1 = Size(0, 0), size2;
    // if (hasChild(1)) {
    //   size1 = layoutChild(1, BoxConstraints.loose(size));

    //   positionChild(1, Offset(0, 0));
    // }
    // if (hasChild(2)) {
    //   size2 = layoutChild(
    //       2,
    //       BoxConstraints(
    //           minWidth: 100, minHeight: 100, maxWidth: 100, maxHeight: 200));
    //   positionChild(2, Offset(size1.width, size1.height));
    // }

    final textSize = layoutChild("text", BoxConstraints.loose(size));
    positionChild("text", Offset(0, 0));
    final lineSize = layoutChild(
        "line",
        BoxConstraints(
            minWidth: textSize.width,
            minHeight: 4,
            maxWidth: textSize.width,
            maxHeight: 4));
    positionChild("line", Offset(0, textSize.height));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class myRenderBox extends SingleChildRenderObjectWidget {
  double distance;

  myRenderBox({Widget? child, required this.distance}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return renderMyRendeBox(distance);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant renderMyRendeBox renderObject) {
    renderObject.distance = distance;
  }
}

class renderMyRendeBox extends RenderProxyBox {
  double distance;
  renderMyRendeBox(this.distance);
  // @override
  // void performLayout() {
  //   child!.layout(constraints, parentUsesSize: true);
  //   size = (child as RenderBox).size;
  // }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child!, Offset(distance, distance));
    });
  }
}
