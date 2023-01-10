import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter/math_utils.dart';

void main() {
  group("math tes", () {
    test("sum test", () {
      final reslut = sum(20, 30);
      expect(reslut, 50);
    });
  });
}
