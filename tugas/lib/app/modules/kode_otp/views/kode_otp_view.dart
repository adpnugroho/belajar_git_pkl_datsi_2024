import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/kode_otp_controller.dart';

class KodeOtpView extends GetView<KodeOtpController> {
  const KodeOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KodeOtpController kodeOtpController = Get.put(KodeOtpController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Kode OTP', style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/otp.png',
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verifikasi kode",
                      style: TextStyle(
                          color: Color(0xff0095FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    Text(
                      "Kami telah mengirimkan kodenya ke",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(
                          "test@gmail.com",
                          style: TextStyle(
                              color: Color(0xff0095FF),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    height: 68,
                    width: 48, // Lebar kotak lebih kecil untuk 6 kotak
                    child: TextField(
                      controller: kodeOtpController.otpControllers[index],
                      onChanged: (value) {
                        if (value.length == 1) {
                          kodeOtpController.updateOtp(index, value);
                          if (index < 5) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        }
                      },
                      style: Theme.of(context).textTheme.headlineMedium,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff0095FF), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff0095FF), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Obx(() {
                int minutes = kodeOtpController.resendCountdown.value ~/ 60;
                int seconds = kodeOtpController.resendCountdown.value % 60;
                String time = "$minutes:${seconds.toString().padLeft(2, '0')}";
                return RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff0095FF),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Kirim Ulang Kode Setelah: ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: time,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: kodeOtpController.resendCode,
                      child: Text("Kirim Ulang",
                          style: TextStyle(
                            color: Color(0xff0095FF),
                          )),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Color(0xff0095FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: kodeOtpController.verifikasiKodeOtp,
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
