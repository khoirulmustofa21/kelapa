import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/data/models/user_model.dart';

import 'package:kelapa_hakam/app/modules/kelapa/controllers/kelapa_controller.dart';
import 'package:kelapa_hakam/app/modules/kelapa/widget/button_widget.dart';
import 'package:kelapa_hakam/component/app_dropdown.dart';
import 'package:kelapa_hakam/component/app_form.dart';
import 'package:kelapa_hakam/theme/typography.dart';

class AddKelapaSection extends StatelessWidget {
  const AddKelapaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KelapaController>();
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
                    'Tambah Kelapa',
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
            GetBuilder<KelapaController>(
              builder: (controller) => AppDropwon<UserModel>(
                initialValue: controller.initalValue,
                item: controller.karyawn.map((e) {
                  return DropdownMenuItem<UserModel>(
                      value: e, child: Text(e.nama.toString()));
                }).toList(),
                hint: 'Pilih nama karyawan',
                onChange: (value) => controller.onSelectedName(value!),
              ),
            ),
            AppForm(
              controller: controller.textKilo,
              hintText: '0',
              keyboardType: TextInputType.number,
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
                          controller.insertKelapa();
                        } else {
                          FocusScope.of(context).unfocus();
                          controller.updateKelap();
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
