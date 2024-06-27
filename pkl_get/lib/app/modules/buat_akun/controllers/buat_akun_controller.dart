import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_get/app/modules/kode_otp/views/kode_otp_view.dart'; // Adjust to your project structure

class BuatAkunController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxInt activeIndex = 0.obs;

  BuatAkunController() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      activeIndex.value++;
      if (activeIndex.value == 4) activeIndex.value = 0;
    });
  }

  void buatAkun() async {
    final String nama = namaController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    if (nama.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Mohon lengkapi semua input',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(Duration(seconds: 2));

      namaController.clear();
      emailController.clear();
      passwordController.clear();

      Get.to(KodeOtpView());
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan. Silakan coba lagi.';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
