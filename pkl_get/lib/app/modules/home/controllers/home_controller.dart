import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  static const List<String> pageRoutes = [
    '/home',
    '/profil',
  ];

  void changePage(int index) {
    selectedIndex.value = index;
    Get.toNamed(pageRoutes[index]);
  }
}
