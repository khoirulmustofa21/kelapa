import 'package:get/get.dart';

class NavbarController extends GetxController {
  final count = 0.obs;

  var tabIndex = 0;
  void changeIndex(int index) {
    tabIndex = index;
    update();
  }

  void increment() => count.value++;
}
