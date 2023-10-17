import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/export_data_controller.dart';

class ExportDataView extends GetView<ExportDataController> {
  const ExportDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExportDataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExportDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
