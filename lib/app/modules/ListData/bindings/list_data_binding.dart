import 'package:get/get.dart';

import '../controllers/list_data_controller.dart';

class ListDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDataController>(
      () => ListDataController(),
    );
  }
}
