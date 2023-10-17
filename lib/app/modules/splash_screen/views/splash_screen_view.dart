import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kelapa_hakam/app/routes/app_pages.dart';
import 'package:kelapa_hakam/component/size.dart';
import 'package:kelapa_hakam/theme/color.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.offAllNamed(Routes.NAVBAR));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: whiteColor,
      child: SizedBox(
        height: height * 0.8,
        width: width * 0.8,
        child: Lottie.asset('assets/animasi/coconut.json'),
      ),
    ));
  }
}
