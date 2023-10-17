import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kelapa_hakam/app/modules/kelapa/views/secssion/add_kelapa_section.dart';
import 'package:kelapa_hakam/app/modules/kelapa/views/secssion/appbar_kelapa_section.dart';
import 'package:kelapa_hakam/app/modules/kelapa/views/secssion/list_kelapa_section.dart';
import 'package:kelapa_hakam/theme/color.dart';

import '../controllers/kelapa_controller.dart';

class KelapaView extends GetView<KelapaController> {
  const KelapaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KelapaController controller = Get.put(KelapaController());
    controller.onInit();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
            onPressed: () {
              Get.bottomSheet(
                isScrollControlled: false,
                enterBottomSheetDuration: 400.milliseconds,
                exitBottomSheetDuration: 400.milliseconds,
                const AddKelapaSection(),
              );
            }),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(1.seconds, () {
              controller.getKelapaUser();
            });
          },
          child: const CustomScrollView(
            slivers: [
              AppBarKelapaSection(),
              ListKelapaSection(),
            ],
          ),
        ));
  }
}
