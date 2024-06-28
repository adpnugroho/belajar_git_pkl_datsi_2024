import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/login_reset_password_controller.dart';

class LoginResetPasswordView extends GetView<LoginResetPasswordController> {
  const LoginResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize LoginResetPasswordController
    final LoginResetPasswordController controller = Get.put(LoginResetPasswordController());

    return Scaffold(
      backgroundColor: Color(0xFFFEFCF3),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();  // Navigates back to the previous screen
          },
        ),
        backgroundColor: Color(0xFFFEFCF3),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                height: 350,
                child: Obx(() => Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: controller.activeIndex.value == 0 ? 1 : 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/As6ct-Fovab32SIyMatjsqIaIjM9Jg1PblII8YAtBtQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTg4/LzNmMDU5Mzc0LTky/OTQtNDk5MC1hZGY2/LTA2YTkyMDZhNWZl/NC5zdmc.png',
                        height: 400,
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: controller.activeIndex.value == 1 ? 1 : 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/vSx9H3yP2D4DgVoaFPbE4HVf6M4Phd-8uRjBZBnl83g/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNC84/MzcwMTY5OS1kYmU1/LTQ1ZmEtYmQ1Ny04/NTFmNTNjMTlkNTcu/c3Zn.png',
                        height: 400,
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: controller.activeIndex.value == 2 ? 1 : 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/fv7W4YUUpGVcNhmKcDGZp6pF1-IDEyCjSjtBB8-Kp_0/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTUv/ZjUzYTU4NDAtNjBl/Yy00ZWRhLWE1YWIt/ZGM1MWJmYjBiYjI2/LnN2Zw.png',
                        height: 400,
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: controller.activeIndex.value == 3 ? 1 : 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/AVdOMf5ui4B7JJrNzYULVwT1z8NlGmlRYZTtg1F6z9E/rs:fit:784:767/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTY5/L2NlMTY1MWM5LTRl/ZjUtNGRmZi05MjQ3/LWYzNGQ1MzhiOTQ0/Mi5zdmc.png',
                        height: 400,
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(height: 40),
              TextField(
                controller: controller.emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  prefixIcon: Icon(Iconsax.sms, color: Colors.black, size: 18),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD7D0C3), width: 2), // Slightly darker border color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA4907C), width: 1.5), // Slightly darker border color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                return controller.isLoading.value
                  ? CircularProgressIndicator()
                  : MaterialButton(
                      onPressed: controller.resetPassword,
                      height: 45,
                      color: Color(0xFFA4907C),
                      child: Text("Reset Password", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );
              }),
              SizedBox(height: 20),
              Obx(() {
                return controller.errorMessage.isNotEmpty
                  ? Text(controller.errorMessage.value, style: TextStyle(color: Colors.red))
                  : SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
