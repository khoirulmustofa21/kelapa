import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_data_controller.dart';

class ListDataView extends GetView<ListDataController> {
  const ListDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListDataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
