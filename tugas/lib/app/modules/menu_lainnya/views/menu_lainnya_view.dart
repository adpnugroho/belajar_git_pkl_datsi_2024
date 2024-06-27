import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get untuk navigasi
import 'package:tugas/app/modules/report_list/views/report_list_view.dart'; // Impor ReportView

class MenuLainnyaView extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      "imagePath": "assets/laporan.png",
      "title": "Laporan Warga",
    },
    {
      "imagePath": "assets/newspaper.png",
      "title": "Berita",
    },
    {
      "imagePath": "assets/pajak.png",
      "title": "Pajak",
    },
    {
      "imagePath": "assets/harga pasar.png",
      "title": "Harga Pasar",
    },
    {
      "imagePath": "assets/bus.png",
      "title": "Transportasi Publik",
    },
    {
      "imagePath": "assets/co2.png",
      "title": "Kondisi Udara",
    },
    {
      "imagePath": "assets/ambulance.png",
      "title": "Ambulan",
    },
    // Tambahkan kategori lainnya jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Kategori',
          style: TextStyle(
            color: Colors.white, // Warna teks diubah menjadi putih
          ),
        ),
        backgroundColor:
            Color(0xff0095FF), // Sesuaikan dengan warna yang kamu inginkan
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
          mainAxisSpacing: 10.0, // Spasi antara item di dalam grid (vertikal)
          crossAxisSpacing:
              10.0, // Spasi antara item di dalam grid (horizontal)
          childAspectRatio: 1.0, // Perbandingan lebar dan tinggi setiap item
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigasi ke ReportView saat kategori "Laporan Warga" ditekan
              if (categories[index]["title"] == "Laporan Warga") {
                Get.to(() => ReportListView());
              } else {
                // Tindakan lainnya bisa ditambahkan jika ada kategori lain
              }
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categories[index]["imagePath"]!,
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    categories[index]["title"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
