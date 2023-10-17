// ignore_for_file: must_be_immutable

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  List<Map<String, dynamic>> itemButtons = [
    {'label': 'Karyawan', 'icon': Icons.person_add},
    {'label': 'Kelapa', 'icon': Icons.add_chart},
    {'label': 'Laporan', 'icon': Icons.list},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0 / 0.3,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: itemButtons.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ElevatedButton.icon(
                icon: Icon(itemButtons[index]['icon']),
                label: Text(itemButtons[index]['label']),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(211, 39, 160, 221),
                ),
                onPressed: () {
                  if (index == 0) {
                    Get.toNamed('/karyawan');
                  } else if (index == 1) {
                    Get.toNamed('/kelapa');
                  } else {}
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
