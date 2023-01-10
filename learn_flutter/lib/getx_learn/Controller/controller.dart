import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Controller extends GetxController {
  var count = 0.obs;
  List arr = [].obs;
  RxInt listCount = 0.obs;
  var user = User('zhangsan', 20).obs;
  inncorment() => count++;
  listAdd() => arr.add('加一');
}

class User {
  User(this.name, this.age);
  String name = "";
  int age = 0;
}
// class Controller extends GetxController {
//   int counter = 0;
//   int counter1 = 10;

//   void increment() {
//     counter++;
//     update(); // 当调用增量时，使用update()来更新用户界面上的计数器变量。
//   }

//   void decoement() {
//     counter1--;
//     update();
//   }
// }
