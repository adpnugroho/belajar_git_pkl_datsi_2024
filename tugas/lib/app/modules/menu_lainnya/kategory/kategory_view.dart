import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/menu_lainnya_view.dart';

class Kategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fitur Lainnya",
          style: TextStyle(
            color: Colors.black, // Ganti dengan warna yang sesuai
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 4,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => MenuLainnyaView());
              },
              child: Text("Unggulan"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(() => Kategori());
              },
              child: Text("Kategori"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Kategori',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Baris 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureCard(
                      'assets/icon/medical-team.png', 'Kesehatan', context),
                  _buildFeatureCard(
                      'assets/icon/people.png', 'Kependudukan', context),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureCard(
                      'assets/icon/school.png', 'Pendidikan', context),
                  _buildFeatureCard(
                      'assets/icon/bus-stop.png', 'Transportasi', context),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureCard('assets/icon/reporting.png',
                      'Laporan & Kedaruratan', context),
                  _buildFeatureCard(
                      'assets/icon/save-the-planet.png', 'Lingkungan', context),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      String imagePath, String label, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tambahkan logika navigasi ke fitur yang sesuai di sini
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45, // Mengatur lebar card
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imagePath, width: 32, height: 32),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ), // Mengatur ukuran teks menjadi 14
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
