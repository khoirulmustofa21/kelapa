import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/modules/karyawan/controllers/karyawan_controller.dart';

import 'package:kelapa_hakam/theme/color.dart';
import 'package:kelapa_hakam/theme/typography.dart';

class ListKaryawanSection extends StatelessWidget {
  const ListKaryawanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KaryawanController());

    return SliverToBoxAdapter(
      child: Obx(() {
        final sortedList = controller.listKaryawan.reversed.toList();
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listKaryawan.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16,
                      index == controller.listKaryawan.length - 1 ? 82 : 8),
                  child: Container(
                    height: 51.h,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.08),
                            blurRadius: 14,
                            offset: const Offset(0, 8),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('${index + 1}'),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            sortedList[index].nama ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: h7Reguler,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                controller.isUpdate(
                                    sortedList[index].id ?? 0,
                                    sortedList[index].nama ?? '',
                                    sortedList[index].gudang ?? '');
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                controller.isDelete(sortedList[index].id ?? 0);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
