import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kelapa_hakam/app/modules/karyawan/controllers/karyawan_controller.dart';
import 'package:kelapa_hakam/component/app_form.dart';

class SearchKaryawanSection extends StatelessWidget {
  const SearchKaryawanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KaryawanController>();
    return SliverToBoxAdapter(
      child: AppForm.search(
        controller: TextEditingController(),
        hintText: 'Cari karyawan',
        onChanged: (value) {
          // controller.searchKaryawan(value);
        },
      ),
    );
  }
}
