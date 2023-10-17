import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kelapa_hakam/app/modules/karyawan/controllers/karyawan_controller.dart';
import 'package:kelapa_hakam/theme/color.dart';

class AppBarKaryawanSection extends StatelessWidget {
  const AppBarKaryawanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KaryawanController());
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      surfaceTintColor: Colors.white,
      pinned: true,
      title: Row(
        children: [
          const Text('Karyawan'),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Obx(
              () => controller.nameButton.value == 'Simpan'
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        controller.setNameButton('Simpan');
                        controller.textNama.clear();
                        controller.textGudang.clear();
                      },
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.amber,
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
