import 'package:get/get.dart';
import 'package:kelapa_hakam/app/modules/kelapa/controllers/kelapa_controller.dart';

class NavbarController extends GetxController {
  final count = 0.obs;
  final kelapaController = Get.put(KelapaController());
  var tabIndex = 0;
  void changeIndex(int index) {
    tabIndex = index;
    if (tabIndex == 2) {
      kelapaController.onReady();
    }
    update();
  }

  void increment() => count.value++;
}
