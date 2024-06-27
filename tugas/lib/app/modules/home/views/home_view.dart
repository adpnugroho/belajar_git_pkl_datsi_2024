import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tugas/app/modules/widget/category.dart'; // Pastikan untuk mengimpor Category
import 'package:tugas/app/modules/report_list/views/report_list_view.dart'; // Impor ReportView
import 'package:tugas/app/modules/menu_lainnya/views/menu_lainnya_view.dart';
import 'package:tugas/app/modules/berita/views/berita_view.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            HomePage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.changePage(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> recommendations = [
    {
      "image": "assets/news.jpg",
      "title": "Berita Hangat",
      "subtitle": "Kami ada beberapa berita hangat untukmu!"
    },
    {
      "image": "assets/promo.jpg",
      "title": "Promo!",
      "subtitle": "Apa saja promo hari ini ya? Ayo kita jelajahi!"
    },
    {
      "image": "assets/cuaca.jpg",
      "title": "Cuaca Terkini",
      "subtitle": "Cuaca akhir akhir ini bagaimana ya?"
    },
    {
      "image": "assets/budaya.jpg",
      "title": "Acara Budaya ",
      "subtitle": "Nikmati berbagai acara budaya yuk!"
    },
  ];

  void _onRecommendationTap(
      BuildContext context, Map<String, String> recommendation) {
    // Logika ketika rekomendasi diklik
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: Color(0xff0095FF),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/profile_pic.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Halo, Selamat datang!",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Iconsax.notification5,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F5F7),
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: "Cari ",
                                prefixIcon: Icon(Iconsax.search_favorite),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Category(
                              imagePath: "assets/laporan.png",
                              title: "Laporan Warga",
                              onTap: () {
                                Get.to(
                                    ReportListView()); // Navigasi ke ReportView
                              },
                            ),
                            Category(
                              imagePath: "assets/newspaper.png",
                              title: "Berita",
                              onTap: () {
                                Get.to(BeritaView());
                                // Tindakan ketika kategori Berita ditekan
                              },
                            ),
                            Category(
                              imagePath: "assets/pajak.png",
                              title: "Pajak",
                              onTap: () {
                                // Tindakan ketika kategori Pajak ditekan
                              },
                            ),
                            Category(
                              imagePath: "assets/harga pasar.png",
                              title: "Harga Pasar",
                              onTap: () {
                                // Tindakan ketika kategori Harga Pasar ditekan
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Category(
                              imagePath: "assets/bus.png",
                              title: "Transportasi Publik",
                              onTap: () {
                                // Tindakan ketika kategori Transportasi Publik ditekan
                              },
                            ),
                            Category(
                              imagePath: "assets/co2.png",
                              title: "Kondisi Udara",
                              onTap: () {
                                // Tindakan ketika kategori Kondisi Udara ditekan
                              },
                            ),
                            Category(
                              imagePath: "assets/ambulance.png",
                              title: "Ambulan",
                              onTap: () {
                                // Tindakan ketika kategori Ambulan ditekan
                              },
                            ),
                            Category(
                              imagePath: "assets/menu.png",
                              title: "Lainnya",
                              onTap: () {
                                Get.to(() =>
                                    MenuLainnyaView()); // Tindakan ketika kategori Lainnya ditekan
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Rekomendasi Untukmu",
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: recommendations.map((recommendation) {
                          return GestureDetector(
                            onTap: () =>
                                _onRecommendationTap(context, recommendation),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Container(
                                  width: 60, // Adjusted width for better fit
                                  height: 60, // Adjusted height for better fit
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        5), // Optional: adding rounded corners
                                    child: Image.asset(
                                      recommendation["image"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(recommendation["title"]!),
                                subtitle: Text(recommendation["subtitle"]!),
                                trailing: Icon(Iconsax.arrow_right_3),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
              color: Colors.white), // Mengatur warna teks menjadi putih
        ),
        backgroundColor: Color(0xff0095FF),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'User',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'test@gmail.com',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            buildListTile(Icons.person, 'Profil Saya', () {
              // Tindakan ketika menu "Profil Saya" ditekan
            }),
            buildListTile(Icons.settings, 'Pengaturan', () {
              // Tindakan ketika menu "Pengaturan" ditekan
            }),
            buildListTile(Icons.help_outline, 'Bantuan', () {
              // Tindakan ketika menu "Bantuan" ditekan
            }),
            buildListTile(Icons.logout, 'Keluar', () {
              // Tindakan ketika menu "Keluar" ditekan
              Get.offAllNamed('/login'); // Navigasi ke halaman login_view
            }),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xff0095FF),
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}

Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(
      icon,
      color: Color(0xff0095FF),
    ),
    title: Text(title),
    onTap: onTap,
  );
}
