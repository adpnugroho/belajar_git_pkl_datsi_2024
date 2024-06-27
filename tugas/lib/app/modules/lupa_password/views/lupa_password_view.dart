import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/lupa_password_controller.dart';
import 'package:tugas/app/modules/kode_otp/views/kode_otp_view.dart'; // Pastikan path ini sesuai dengan lokasi KodeOtpView

class LupaPasswordView extends GetView<LupaPasswordController> {
  const LupaPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize LupaPasswordController
    final LupaPasswordController controller = Get.put(LupaPasswordController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                height: 350,
                child: Image.asset(
                  'assets/reset.jpg', // Ganti dengan path ke gambar aset Anda
                  height: 400,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: controller.emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'Email',
                  hintText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                return controller.isLoading.value
                    ? CircularProgressIndicator()
                    : MaterialButton(
                        onPressed: () {
                          controller.resetPassword();
                          Get.to(KodeOtpView());
                        },
                        height: 45,
                        color: Color(0xff0095FF),
                        child: Text(
                          "Reset Password",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      );
              }),
              SizedBox(height: 20),
              Obx(() {
                return controller.errorMessage.isNotEmpty
                    ? Text(controller.errorMessage.value,
                        style: TextStyle(color: Colors.red))
                    : SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
