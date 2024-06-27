import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  DateTime? selectedDate;
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Laporan Warga",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 4,
        backgroundColor:
            Color(0xff0095FF), // Ubah warna background AppBar menjadi biru
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/reporter.png',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'Buat Laporan',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: width * .9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(69, 53, 43, 43),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Nama Laporan",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: width * .9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(69, 53, 43, 43),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      maxLines: null, // Mengubah TextField menjadi TextArea
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Keterangan",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: width * .9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(69, 53, 43, 43),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Tanggal Kejadian",
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null &&
                                pickedDate != selectedDate) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      controller: TextEditingController(
                        text: selectedDate == null
                            ? ''
                            : dateFormat.format(selectedDate!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Menampilkan snackbar untuk notifikasi
                    Get.snackbar(
                      'Laporan Terkirim',
                      'Laporan Anda telah berhasil dikirim.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );

                    // Mengarahkan kembali ke halaman home setelah delay
                    Future.delayed(const Duration(seconds: 2), () {
                      Get.offNamed(
                          '/home'); // Mengarahkan kembali ke halaman home
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * .9, 50),
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor: Colors.white, // Text color
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Kirim Laporan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
