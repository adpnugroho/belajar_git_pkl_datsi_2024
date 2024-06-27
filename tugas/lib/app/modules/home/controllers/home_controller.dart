import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable for tracking the selected index
  var selectedIndex = 0.obs;

  // Method to change the selected index
  void changePage(int index) {
    selectedIndex.value = index;
  }
}