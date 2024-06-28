import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginResetPasswordController extends GetxController {
  final emailController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;

  var activeIndex = 0.obs; // Add this line to define activeIndex

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      errorMessage.value = "Email cannot be empty";
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    successMessage.value = '';

    // Simulate reset password process
    await Future.delayed(Duration(seconds: 2));

    isLoading.value = false;

    // Simple validation example:
    if (emailController.text == "test@gmail.com") {
      successMessage.value = "Password reset link has been sent to your email";
      // Navigate back to LoginView after successful reset
      Get.back();
    } else {
      errorMessage.value = "Email not found";
    }
  }

  LoginResetPasswordController() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      activeIndex.value++;
      if (activeIndex.value == 4) activeIndex.value = 0;
    });
  }

  @override
  void onClose() {
    emailController.dispose(); // Dispose of the text editing controller
    super.onClose();
  }
}
