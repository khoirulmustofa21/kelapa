import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kelapa_hakam/theme/color.dart';

class AppForm extends StatefulWidget {
  const AppForm(
      {super.key,
      required this.controller,
      this.lableName,
      this.hintText,
      this.onChanged,
      this.isSearch = false,
      this.keyboardType});

  const AppForm.search(
      {super.key,
      required this.controller,
      this.lableName,
      this.hintText,
      this.onChanged,
      this.isSearch = true,
      this.keyboardType});

  final TextEditingController controller;
  final String? lableName;
  final String? hintText;
  final bool isSearch;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  OutlineInputBorder get _outline {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: softBlack,
        width: 1.2,
      ),
    );
  }

  OutlineInputBorder get _outlineFocus {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: primaryColor, width: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: TextFormField(
        controller: widget.controller,
        initialValue: null,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            prefixIcon: widget.isSearch ? const Icon(Icons.search) : null,
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            border: _outline,
            enabledBorder: _outline,
            focusedBorder: _outlineFocus),
        onChanged: widget.onChanged,
      ),
    );
  }
}
