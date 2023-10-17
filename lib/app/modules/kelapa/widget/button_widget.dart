import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kelapa_hakam/component/size.dart';
import 'package:kelapa_hakam/theme/color.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.text, this.onPressed, this.isLoading});

  final bool? isLoading;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: width,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r))),
        onPressed: onPressed,
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: TextStyle(fontSize: 16.sp),
              ),
      ),
    );
  }
}
