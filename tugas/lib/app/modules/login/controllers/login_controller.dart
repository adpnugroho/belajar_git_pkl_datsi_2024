import 'package:get/get.dart';
import 'package:tugas/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void login() {
    // Logic for login
    // You can use email.value and password.value to authenticate the user
    print('Email: ${email.value}, Password: ${password.value}');
    Get.offAll(HomeView());
  }
}
