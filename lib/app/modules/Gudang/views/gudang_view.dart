import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gudang_controller.dart';

class GudangView extends GetView<GudangController> {
  const GudangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GudangView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GudangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
