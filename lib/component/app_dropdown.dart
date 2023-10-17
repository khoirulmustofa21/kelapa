import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kelapa_hakam/component/size.dart';
import 'package:kelapa_hakam/theme/color.dart';

class AppDropwon<T extends Object> extends StatelessWidget {
  const AppDropwon(
      {super.key,
      this.data,
      this.initialValue,
      this.onChange,
      this.hint,
      this.item});
  final List<T>? data;
  final Function(T?)? onChange;
  final T? initialValue;
  final String? hint;
  final List<DropdownMenuItem<T>>? item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: initialValue == null ? softBlack : primaryColor,
            width: 1.2,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.08),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(),
        child: DropdownButton<T>(
            value: initialValue,
            hint: Text(hint ?? ''),
            isDense: true,
            isExpanded: true,
            underline: const SizedBox(),
            items: item,
            onChanged: onChange),
      ),
    );
  }
}
