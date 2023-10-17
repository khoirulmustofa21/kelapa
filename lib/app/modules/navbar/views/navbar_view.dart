import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelapa_hakam/app/modules/Gudang/views/gudang_view.dart';
import 'package:kelapa_hakam/app/modules/ListData/views/list_data_view.dart';

import 'package:kelapa_hakam/app/modules/karyawan/views/karyawan_view.dart';
import 'package:kelapa_hakam/app/modules/kelapa/views/kelapa_view.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            KaryawanView(),
            GudangView(),
            KelapaView(),
            ListDataView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.tabIndex,
          onTap: controller.changeIndex,
          selectedItemColor: const Color.fromARGB(211, 39, 160, 221),
          unselectedItemColor: Colors.grey.shade500,
          selectedLabelStyle: GoogleFonts.lato(),
          items: [
            _itemBar(Icons.person_add, "Karyawan"),
            _itemBar(Icons.app_registration_rounded, "Gudang"),
            _itemBar(Icons.playlist_add_circle_rounded, "Kelapa"),
            _itemBar(Icons.view_list_sharp, "List Data"),
          ],
        ),
      );
    });
  }
}

_itemBar(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
