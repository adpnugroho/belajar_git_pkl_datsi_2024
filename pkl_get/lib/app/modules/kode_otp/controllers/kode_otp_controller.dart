import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_get/app/modules/login/views/login_view.dart'; // Adjust according to your project structure

class KodeOtpController extends GetxController {
  final TextEditingController kodeOtpController = TextEditingController();
  final RxList<String> otp = List<String>.filled(4, '').obs;
  final RxInt resendCountdown = 96.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  KodeOtpController() {
    _startResendTimer();
  }

  void verifikasiKodeOtp() async {
    final String kodeOtp = otp.join();

    if (kodeOtp.isEmpty || kodeOtp.length < 4) {
      Get.snackbar('Error', 'Mohon lengkapi semua input',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(Duration(seconds: 2));

      if (kodeOtp == '1234') {
        Get.snackbar('Sukses', 'Akun berhasil dibuat',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);

        Future.delayed(Duration(seconds: 1), () {
          Get.offAll(LoginView());
        });
      } else {
        errorMessage.value = 'Kode OTP tidak valid';
        Get.snackbar('Error', errorMessage.value,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan. Silakan coba lagi.';
      Get.snackbar('Error', errorMessage.value,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void updateOtp(int index, String value) {
    if (value.length == 1) {
      otp[index] = value;
      otp.refresh();
    }
  }

  void _startResendTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendCountdown.value > 0) {
        resendCountdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    resendCountdown.value = 96;
    _startResendTimer();
    // Implement resend code logic here
  }

  @override
  void onClose() {
    kodeOtpController.dispose();
    super.onClose();
  }
}
