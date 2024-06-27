import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeritaView extends StatelessWidget {
  final List<Map<String, dynamic>> beritaList = [
    {
      "title":
          "Pria di Balikpapan Cabuli Anak Tiri, Pelaku Kepergok Kakak Kandung Korban",
      "content":
          "Balikpapan - Pria berinisial ES (40) di Balikpapan,Kalimantan Timur (Kaltim), ditangkap polisi gegara tega mencabuli anak tirinya yang masih berusia 12 tahun dan disabilitas. Kasus ini terungkap usai aksi asusila pelaku ketahuan kakak kandung korban. 'Pelaku ditangkap karena kedapatan kakak kandung korban yang melihat sendiri ayah tirinya tersebut mencabuli adiknya,' ujar Kanit PPA Polresta Balikpapan pda Futuhatul Laduniyah kepada detikcom, Kamis (13/6/2024).",
      "imagePath": "assets/news1.jpg",
    },
  ];

  void _showDetailBerita(BuildContext context, Map<String, dynamic> berita) {
    Get.to(() => DetailBeritaPage(berita: berita));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Berita",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: ListView.builder(
          itemCount: beritaList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      beritaList[index]["imagePath"],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    beritaList[index]["title"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    beritaList[index]["content"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    _showDetailBerita(context, beritaList[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailBeritaPage extends StatelessWidget {
  final Map<String, dynamic> berita;

  DetailBeritaPage({required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          berita["title"],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                berita["imagePath"],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(
              berita["content"],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
