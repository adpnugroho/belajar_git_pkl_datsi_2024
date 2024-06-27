import 'package:get/get.dart';

class BuatAkunController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  void setUsername(String value) {
    username.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  void signup() {
    // Add your signup logic here
    print('Username: ${username.value}');
    print('Email: ${email.value}');
    print('Password: ${password.value}');
    print('Confirm Password: ${confirmPassword.value}');
  }
}
