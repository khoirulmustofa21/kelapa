import 'package:get/get.dart';

import '../controllers/gudang_controller.dart';

class GudangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GudangController>(
      () => GudangController(),
    );
  }
}
