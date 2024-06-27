import 'package:get/get.dart';

import '../controllers/menu_lainnya_controller.dart';

class MenuLainnyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuLainnyaController>(
      () => MenuLainnyaController(),
    );
  }
}
