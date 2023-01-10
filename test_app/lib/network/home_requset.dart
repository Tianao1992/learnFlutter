import 'dart:convert';

import 'conifg.dart';
import 'http_requset.dart';
import '../pages/model/home_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeRquest {
  static Future<List<MovieItem>> requsetMoveList() async {
    String result = await rootBundle.loadString('assets/test.json');
    final jsonResult = json.decode(result);
    final subjcet = jsonResult["subjects"];
    List<MovieItem> movies = [];
    for (var sub in subjcet) {
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}
