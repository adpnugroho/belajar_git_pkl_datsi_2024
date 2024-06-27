import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_get/app/data/list.dart';
import 'package:pkl_get/app/data/category.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Header Section
          Stack(
            children: [
              Container(
                  height: 140, width: double.infinity, color: Colors.blue),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            GestureDetector(
                              onTap: () {
                                 Get.toNamed('/profile');
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                                    ),
                                    fit: BoxFit
                                        .cover, // Atur sesuai kebutuhan Anda
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Halo Maulana, Selamat datang",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize:
                                    15.0, // Sesuaikan ukuran font yang diinginkan
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "CARI BERITA",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                list(
                    onPressed: () {
                      Get.toNamed('/report');
                    },
                    imagePath: 'assets/icon/loudspeaker.png',
                    title: "Laporan Warga"),
                list(
                    onPressed: () {
                      Get.toNamed('/berita');
                    },
                    imagePath: 'assets/icon/newspaper.png',
                    title: "Berita"),
                list(
                    onPressed: () {},
                    imagePath: 'assets/icon/material.png',
                    title: "Harga Pangan"),
                list(
                    onPressed: () {},
                    imagePath: 'assets/icon/taxes.png',
                    title: "Pajak"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                list(
                    onPressed: () {},
                    imagePath: 'assets/icon/ambulance.png',
                    title: "Ambulans"),
                list(
                    onPressed: () {},
                    imagePath: 'assets/icon/bus-stop.png',
                    title: "Transportasi Publik"),
                list(
                    onPressed: () {},
                    imagePath: 'assets/icon/air-quality.png',
                    title: "Kualitas Udara"),
                list(
                    onPressed: () {
                      Get.toNamed('/menu-lainnya');
                    },
                    imagePath: 'assets/icon/menu.png',
                    title: "Semua"),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15),
          //   child: Text(
          //     "Rekomendasi buat kamu",
          //     style: GoogleFonts.montserrat(
          //         fontSize: 18, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // rekomendasi(
          //   imagePath: "assets/images/SelamatDatang.png",
          //   nameShop: " > Pendatang Baru",
          // ),
          // rekomendasi(
          //   imagePath: "assets/images/PenggunaBaru.png",
          //   nameShop: " > Pengguna Baru",
          // ),
          // rekomendasi(
          //   imagePath: "assets/images/TetapBugar.png",
          //   nameShop: " > Tetap Bugar di Balikpapan",
          // ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Jelajahi Berdasarkan Kategori",  
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Category(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Rekomendasi Buat Kamu",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/PenggunaBaru.png",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Pengguna Baru",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Mulai Mencoba Fitur yang telah Saya buat",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/SelamatDatang.png",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Pendatang Baru",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Selamat Datang di project dasar Saya",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}