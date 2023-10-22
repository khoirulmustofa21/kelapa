import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/modules/karyawan/views/sections/add_karyawan_section.dart';

import 'package:kelapa_hakam/app/modules/karyawan/views/sections/appbar.dart';
import 'package:kelapa_hakam/app/modules/karyawan/views/sections/list_karyawan_sections.dart';

import 'package:kelapa_hakam/theme/color.dart';
import '../controllers/karyawan_controller.dart';

class KaryawanView extends GetView<KaryawanController> {
  const KaryawanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KaryawanController controller = Get.put(KaryawanController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: "btnKaryawan",
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
          onPressed: () {
            controller.resetTextForm();
            Get.bottomSheet(
              isScrollControlled: false,
              enterBottomSheetDuration: 400.milliseconds,
              exitBottomSheetDuration: 400.milliseconds,
              const AddKaryawanSection(),
            );
          }),
      body: const CustomScrollView(
        slivers: [
          AppBarKaryawanSection(),
          ListKaryawanSection(),
        ],
      ),
    );
  }
}
