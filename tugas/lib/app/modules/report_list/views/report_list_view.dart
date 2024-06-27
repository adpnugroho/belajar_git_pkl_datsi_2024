import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// Pastikan untuk mengimpor ReportView
import 'package:tugas/app/modules/report/views/report_view.dart';

class ReportListView extends StatelessWidget {
  final List<Map<String, dynamic>> laporanList = [
    {
      "title": "Laporan Banjir",
      "content":
          "Banjir yang melanda Kota Balikpapan sejak Rabu malam (24/8/2024) hingga Kamis pagi (25/8/2024) masih terjadi. Sejumlah kawasan pun turut terendam banjir termasuk area Mal Pentacity yang berada di Balikpapan Selatan..",
      "imagePath": "assets/flood.jpg",
    },
  ];

  void _showDetailLaporan(BuildContext context, Map<String, dynamic> laporan) {
    Get.to(() => DetailLaporanPage(laporan: laporan));
  }

  void _addNewLaporan(BuildContext context) {
    Get.to(() => ReportView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan Warga',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff0095FF),
      ),
      backgroundColor: Colors.brown[50],
      body: ListView.builder(
        itemCount: laporanList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                title: Text(
                  laporanList[index]["title"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  laporanList[index]["content"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(Iconsax.arrow_right_3),
                onTap: () {
                  _showDetailLaporan(context, laporanList[index]);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewLaporan(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff0095FF),
      ),
    );
  }
}

class DetailLaporanPage extends StatelessWidget {
  final Map<String, dynamic> laporan;

  DetailLaporanPage({required this.laporan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          laporan["title"],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff0095FF),
      ),
      backgroundColor: Colors.brown[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                laporan["imagePath"],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(
              laporan["content"],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
