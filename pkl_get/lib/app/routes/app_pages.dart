import 'package:get/get.dart';

import '../modules/buat_akun/bindings/buat_akun_binding.dart';
import '../modules/buat_akun/views/buat_akun_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kode_otp/bindings/kode_otp_binding.dart';
import '../modules/kode_otp/views/kode_otp_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_reset_password/bindings/login_reset_password_binding.dart';
import '../modules/login_reset_password/views/login_reset_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(), // Remove `const` keyword here
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(), // Remove `const` keyword here
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_RESET_PASSWORD,
      page: () => LoginResetPasswordView(), // Remove `const` keyword here
      binding: LoginResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_AKUN,
      page: () => BuatAkunView(), // Remove `const` keyword here
      binding: BuatAkunBinding(),
    ),
    GetPage(
      name: _Paths.KODE_OTP,
      page: () => KodeOtpView(), // Remove `const` keyword here
      binding: KodeOtpBinding(),
    ),
  ];
}
