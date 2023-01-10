// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'dart:async';

class Anchor {
  String nickname = "";
  String roomName = "";
  String imageUrl = "";
  Anchor(
      {required this.nickname, required this.roomName, required this.imageUrl});
  Anchor.withMap(Map<String, dynamic> parsedMap) {
    nickname = parsedMap["nickname"];
    roomName = parsedMap["roomName"];
    imageUrl = parsedMap["imageUrl"];
  }
}

Future<List<Anchor>> getAnchors() async {
  String jsonStr = await rootBundle.loadString('assets/ts.json');
  final jsonResult = json.decode(jsonStr);
  final arr = jsonResult["Anchor"];
  print(jsonResult);
  List<Anchor> anchors = [];

  for (Map<String, dynamic> map in arr) {
    anchors.add(Anchor.withMap(map));
  }
  return anchors;
}
