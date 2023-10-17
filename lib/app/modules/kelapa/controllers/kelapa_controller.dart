import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/data/models/kelapa_user_model.dart';
import 'package:kelapa_hakam/app/data/models/user_model.dart';
import 'package:kelapa_hakam/app/data/providers/kelapa_provider.dart';

class KelapaController extends GetxController {
  final _provider = KelapaProvier();
  TextEditingController textNama = TextEditingController();
  TextEditingController textKilo = TextEditingController();
  late TextEditingController nama;
  var isLoading = false.obs;
  RxString nameButton = 'Simpan'.obs;
  // String? initalValue;
  UserModel? initalValue;
  List<KelapaUserModel> listkelapaUser = [];

  List<UserModel> karyawn = [];

  List<String> listNameKaryawan = [];
  List listKelapa = [];

  final count = 0.obs;

  getNamaKaryawan() async {
    final data = await _provider.getNameKaryawan();
    listNameKaryawan = data.map((e) => e['nama'].toString()).toList();
    update();
    if (kDebugMode) {
      // print(listNameKaryawan);s
    }
  }

  getkaryawan() async {
    final data = await _provider.getKaryawan();
    karyawn = data;

    if (kDebugMode) {
      // print(karyawn);
    }
  }

  onSelectedName(UserModel value) {
    initalValue = value;
    update();
    // print(value.id);
    // print("ini adalah initial value $initalValue");
  }

  @override
  void onInit() {
    super.onInit();

    nama = TextEditingController(text: '');
    getNamaKaryawan();
  }

  @override
  void onReady() {
    super.onReady();
    getkaryawan();
    getNamaKaryawan();
    getKelapaUser();
  }

  void increment() => count.value++;

  onSelect(UserModel value) {
    nama = TextEditingController(text: value.nama);
    update();
  }

  setNameButton(String name) {
    nameButton.value = name;
  }

  resetTextForm() {
    textNama.clear();
    textKilo.clear();
  }

  insertKelapa() {}
  updateKelap() {}

  getAllKelapa() async {
    listKelapa = await _provider.getAll();

    if (kDebugMode) {
      print(listKelapa);
    }
  }

  getKelapaUser() async {
    final data = await _provider.getKelapaUser();
    listkelapaUser = data;
    update();
    if (kDebugMode) {
      print(listkelapaUser.map(
          (e) => " nama : ${e.users?.nama ?? ''}  =>  kilo : ${e.kilo} \n"));
    }
  }
}
