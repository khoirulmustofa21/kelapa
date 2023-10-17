import 'package:get/get.dart';

import '../controllers/kelapa_controller.dart';

class KelapaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelapaController>(
      () => KelapaController(),
    );
  }
}
