import 'package:get/get.dart';

import '../controllers/buat_akun_controller.dart';

class BuatAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatAkunController>(
      () => BuatAkunController(),
    );
  }
}
