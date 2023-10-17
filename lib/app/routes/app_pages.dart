import 'package:get/get.dart';

import '../modules/ExportData/bindings/export_data_binding.dart';
import '../modules/ExportData/views/export_data_view.dart';
import '../modules/Gudang/bindings/gudang_binding.dart';
import '../modules/Gudang/views/gudang_view.dart';
import '../modules/ListData/bindings/list_data_binding.dart';
import '../modules/ListData/views/list_data_view.dart';
import '../modules/export/bindings/export_binding.dart';
import '../modules/export/views/export_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informations/bindings/informations_binding.dart';
import '../modules/informations/views/informations_view.dart';
import '../modules/karyawan/bindings/karyawan_binding.dart';
import '../modules/karyawan/views/karyawan_view.dart';
import '../modules/kelapa/bindings/kelapa_binding.dart';
import '../modules/kelapa/views/kelapa_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: _Paths.EXPORT,
      page: () => const ExportView(),
      binding: ExportBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATIONS,
      page: () => const InformationsView(),
      binding: InformationsBinding(),
    ),
    GetPage(
      name: _Paths.KARYAWAN,
      page: () => const KaryawanView(),
      binding: KaryawanBinding(),
    ),
    GetPage(
      name: _Paths.KELAPA,
      page: () => const KelapaView(),
      binding: KelapaBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DATA,
      page: () => const ListDataView(),
      binding: ListDataBinding(),
    ),
    GetPage(
      name: _Paths.GUDANG,
      page: () => const GudangView(),
      binding: GudangBinding(),
    ),
    GetPage(
      name: _Paths.EXPORT_DATA,
      page: () => const ExportDataView(),
      binding: ExportDataBinding(),
    ),
  ];
}
