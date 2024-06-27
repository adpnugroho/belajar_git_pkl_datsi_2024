import 'package:get/get.dart';

import '../controllers/kode_otp_controller.dart';

class KodeOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KodeOtpController>(
      () => KodeOtpController(),
    );
  }
}
