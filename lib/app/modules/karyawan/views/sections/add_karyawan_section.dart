import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/modules/karyawan/controllers/karyawan_controller.dart';
import 'package:kelapa_hakam/app/modules/kelapa/widget/button_widget.dart';
import 'package:kelapa_hakam/component/app_form.dart';
import 'package:kelapa_hakam/theme/typography.dart';

class AddKaryawanSection extends StatelessWidget {
  const AddKaryawanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KaryawanController>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tambah Karyawan',
                    style: h5SemiBold,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      controller.resetTextForm();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            AppForm(
              controller: controller.textNama,
              hintText: 'Nama',
            ),
            AppForm(
              controller: controller.textGudang,
              hintText: 'Gudang',
            ),
            Obx(
              () => ButtonWidget(
                isLoading: controller.isLoading.value,
                text: controller.nameButton.value,
                onPressed: controller.isLoading.isTrue
                    ? null
                    : () {
                        if (controller.nameButton.value == 'Simpan') {
                          FocusScope.of(context).unfocus();
                          controller.insertUser(context);
                        } else {
                          FocusScope.of(context).unfocus();
                          controller.karyawanUpdate(
                            controller.idForUpdate.value,
                            context,
                          );
                        }
                        controller.setNameButton('Simpan');
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
