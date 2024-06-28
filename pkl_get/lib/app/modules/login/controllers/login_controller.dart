import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_get/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var activeIndex = 0.obs;

  LoginController() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      activeIndex.value++;
      if (activeIndex.value == 4) activeIndex.value = 0;
    });
  }

  void login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      errorMessage.value = "Username dan Password tidak boleh kosong";
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    // Simulate login process
    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;

    // Simple validation:
    if (usernameController.text == "admin" && passwordController.text == "admin") {
      Get.snackbar("Login Berhasil", "Kamu berhasil masuk");
      // Navigate to another page here
      Get.offAll(HomeView()); // Replace HomeView() with your actual home screen widget
    } else {
      errorMessage.value = "Username atau Password salah";
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
