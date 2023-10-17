import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/modules/kelapa/controllers/kelapa_controller.dart';

class ListKelapaSection extends StatelessWidget {
  const ListKelapaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KelapaController());
    return GetBuilder<KelapaController>(builder: (context) {
      return SliverList.builder(
          itemCount: controller.listkelapaUser.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.listkelapaUser[index].users?.nama ?? ''),
              subtitle: Text(
                  "${controller.listkelapaUser[index].kilo.toString()} Kg"),
            );
          });
    });
  }
}
