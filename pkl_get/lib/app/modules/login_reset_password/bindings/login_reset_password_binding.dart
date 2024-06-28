import 'package:get/get.dart';

import '../controllers/login_reset_password_controller.dart';

class LoginResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginResetPasswordController>(
      () => LoginResetPasswordController(),
    );
  }
}
