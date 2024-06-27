import 'package:get/get.dart';

import 'package:tugas/app/modules/berita/bindings/berita_binding.dart';
import 'package:tugas/app/modules/berita/views/berita_view.dart';
import 'package:tugas/app/modules/buat_akun/bindings/buat_akun_binding.dart';
import 'package:tugas/app/modules/buat_akun/views/buat_akun_view.dart';
import 'package:tugas/app/modules/home/bindings/home_binding.dart';
import 'package:tugas/app/modules/home/views/home_view.dart';
import 'package:tugas/app/modules/kode_otp/bindings/kode_otp_binding.dart';
import 'package:tugas/app/modules/kode_otp/views/kode_otp_view.dart';
import 'package:tugas/app/modules/login/bindings/login_binding.dart';
import 'package:tugas/app/modules/login/views/login_view.dart';
import 'package:tugas/app/modules/lupa_password/bindings/lupa_password_binding.dart';
import 'package:tugas/app/modules/lupa_password/views/lupa_password_view.dart';
import 'package:tugas/app/modules/menu_lainnya/bindings/menu_lainnya_binding.dart';
import 'package:tugas/app/modules/menu_lainnya/views/menu_lainnya_view.dart';
import 'package:tugas/app/modules/report/bindings/report_binding.dart';
import 'package:tugas/app/modules/report/views/report_view.dart';
import 'package:tugas/app/modules/report_list/bindings/report_list_binding.dart';
import 'package:tugas/app/modules/report_list/views/report_list_view.dart';
import 'package:tugas/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:tugas/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_AKUN,
      page: () => BuatAkunView(),
      binding: BuatAkunBinding(),
    ),
    GetPage(
      name: _Paths.KODE_OTP,
      page: () => KodeOtpView(),
      binding: KodeOtpBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.MENU_LAINNYA,
      page: () => MenuLainnyaView(),
      binding: MenuLainnyaBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_PASSWORD,
      page: () => LupaPasswordView(),
      binding: LupaPasswordBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_LIST,
      page: () => ReportListView(),
      binding: ReportListBinding(),
    ),
  ];
}
