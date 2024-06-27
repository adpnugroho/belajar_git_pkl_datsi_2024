import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas/app/modules/buat_akun/controllers/buat_akun_controller.dart';
import 'package:tugas/app/modules/login/views/login_view.dart';

class BuatAkunView extends StatelessWidget {
  final BuatAkunController controller = Get.put(BuatAkunController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Buat Akun",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Buat Akun yuk! Gratis loh",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(
                    label: "Nama",
                    onChanged: (value) {
                      controller.setUsername(value);
                    },
                  ),
                  inputFile(
                    label: "Email",
                    onChanged: (value) {
                      controller.setEmail(value);
                    },
                  ),
                  inputFile(
                    label: "Kata Sandi",
                    obscureText: true,
                    onChanged: (value) {
                      controller.setPassword(value);
                    },
                  ),
                  inputFile(
                    label: "Konfirmasi Kata Sandi Anda",
                    obscureText: true,
                    onChanged: (value) {
                      controller.setConfirmPassword(value);
                    },
                  ),
                ],
              ),
              Container(
                //padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Get.to(LoginView());
                    controller.signup();
                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Buat Akun",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sudah Punya Akun?"),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile(
    {required String label,
    bool obscureText = false,
    required Function(String) onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 5),
      TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
