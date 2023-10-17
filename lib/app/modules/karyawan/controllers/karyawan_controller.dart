import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/data/models/user_model.dart';

import 'package:kelapa_hakam/app/data/providers/user_provider.dart';
import 'package:kelapa_hakam/app/modules/karyawan/views/sections/add_karyawan_section.dart';
import 'package:kelapa_hakam/component/confirmation_dialog.dart';

class KaryawanController extends GetxController {
  final count = 0.obs;
  final service = UserProvider();
  final _listKaryawan = <UserModel>[].obs;
  RxList<UserModel> get listKaryawan => _listKaryawan;
  var srchKaryawan = <UserModel>[].obs;

  RxInt idForUpdate = 0.obs;
  var isLoading = false.obs;
  RxString nameButton = 'Simpan'.obs;
  TextEditingController textNama = TextEditingController();
  TextEditingController textGudang = TextEditingController();

  resetTextForm() {
    textNama.clear();
    textGudang.clear();
  }

  setKaryawan(List<UserModel> data) {
    _listKaryawan.value = data;
    srchKaryawan.value = data;
  }

  searchKaryawan(String value) {
    srchKaryawan.value = _listKaryawan
        .where((karyawan) =>
            karyawan.nama!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  isDelete(int id) {
    Get.dialog(ConfirmationDialog(
      title: 'Apakah Ingin Menghapus?',
      onConfirm: () {
        delete(id);
        Get.back();
      },
    ));
  }

  isUpdate(int id, String nama, String gudang) async {
    setNameButton('Update');
    setIdForUpdate(id);
    textNama.text = nama;
    textGudang.text = gudang;
    await Future.delayed(
      200.milliseconds,
      () => Get.bottomSheet(
        isScrollControlled: false,
        enterBottomSheetDuration: 400.milliseconds,
        exitBottomSheetDuration: 400.milliseconds,
        const AddKaryawanSection(),
      ),
    );
  }

  setNameButton(String name) {
    nameButton.value = name;
  }

  setIdForUpdate(int id) {
    idForUpdate.value = id;
  }

  getKaryawan() async {
    final data = await service.fetchData();
    setKaryawan(data);
  }

  karyawanUpdate(int id, context) async {
    isLoading.value = true;

    bool updateData = await service.update(
        id: id, nama: textNama.text, gudang: textGudang.text);
    if (updateData == true) {
      if (kDebugMode) {
        print('Success Update');
      }
      isLoading.value = false;

      Get.showSnackbar(GetSnackBar(
        message: 'Berhasil Update Data',
        margin: const EdgeInsets.all(16),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 10.r,
        duration: 2.seconds,
      ));
      textNama.clear();
      textGudang.clear();
      await getKaryawan();
    } else {
      Get.showSnackbar(GetSnackBar(
        message: 'Gagal Update Data',
        margin: const EdgeInsets.all(16),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        borderRadius: 10.r,
        duration: 2.seconds,
      ));
    }
  }

  delete(int id) async {
    try {
      bool deleteData = await service.deleteData(id);
      if (deleteData == true) {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          message: 'Berhasil Menghapus Data',
          margin: const EdgeInsets.all(16),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          borderRadius: 10.r,
          duration: 2.seconds,
        ));
        await getKaryawan();
      } else {
        if (kDebugMode) {
          print('Gagal Hapus data');
        }
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          message: 'Gagal Menghapus Data',
          margin: const EdgeInsets.all(16),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          borderRadius: 10.r,
          duration: 2.seconds,
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void increment() => count.value++;

  insertUser(BuildContext context) async {
    if (textNama.text.isNotEmpty && textGudang.text.isNotEmpty) {
      isLoading.value = true;
      try {
        bool addData = await service.postData(
            nama: textNama.text, gudang: textGudang.text);
        if (addData == true) {
          isLoading.value = false;
          Get.showSnackbar(GetSnackBar(
            message: 'Berhasil Menambahkan Data',
            margin: const EdgeInsets.all(16),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            borderRadius: 10.r,
            duration: 2.seconds,
          ));
          textNama.clear();
          textGudang.clear();
          getKaryawan();
        } else {
          isLoading.value = false;
          Get.showSnackbar(GetSnackBar(
            message: 'Gagal Menambahkan Data',
            margin: const EdgeInsets.all(16),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            borderRadius: 10.r,
            duration: 2.seconds,
          ));
        }
      } catch (e) {
        isLoading.value = false;

        if (e is DioException) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            duration: const Duration(seconds: 3),
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: '${e.response?.data['message']}',
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: 'Gagal Menambahkan Data',
        margin: const EdgeInsets.all(16),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        borderRadius: 10.r,
        duration: 2.seconds,
      ));
    }
  }
}
