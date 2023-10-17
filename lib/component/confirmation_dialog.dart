import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key, this.onConfirm, this.title});
  final String? title;
  final Function()? onConfirm;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        height: 100.h,
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(150, 40),
                    ),
                  ),
                  onPressed: onConfirm,
                  child: const Text('Konfirmasi'),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(150, 40),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Batal'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
