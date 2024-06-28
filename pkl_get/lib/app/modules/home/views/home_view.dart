import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:pkl_get/app/modules/home/widget/category.dart';

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
          backgroundColor: Color(
              0xFF8D7B68), // Ubah warna background BottomNavigationBar menjadi hitam
          selectedItemColor:
              Colors.white, // Ubah warna item terpilih menjadi putih
          unselectedItemColor:
              Colors.grey, // Ubah warna item tidak terpilih menjadi abu-abu
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home,
                  color: Colors.white), // Ubah warna ikon menjadi putih
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user,
                  color: Colors.white), // Ubah warna ikon menjadi putih
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
      "title": "Berita Terbaru",
      "subtitle": "Dapatkan berita terbaru setiap hari",
      "image": "assets/travel.jpg"
    },
    {
      "title": "Promo Hari Ini",
      "subtitle": "Cek promo menarik hari ini",
      "image": "assets/promo.jpg"
    },
    {
      "title": "Cuaca Terkini",
      "subtitle": "Informasi cuaca terbaru di daerahmu",
      "image": "assets/weather.jpg"
    },
    {
      "title": "Event Terdekat",
      "subtitle": "Cari tahu event yang akan datang",
      "image": "assets/event.jpg"
    },
  ];

  void _onCategoryTap(String category) {
    print("Tapped on $category");
    if (category == "Berita") {
      Get.to(() => BeritaPage());
    } else if (category == "Laporan Warga") {
      Get.to(() => LaporanPage()); // Navigasi ke halaman laporan
    } else if (category == "Lainnya") {
      _showAllCategories(); // Panggil method untuk menampilkan semua kategori
    }
  }

  void _showAllCategories() {
    // Menampilkan semua kategori
    Get.defaultDialog(
      title: "Semua Kategori",
      backgroundColor: Colors.brown[50], // Background color set to light brown
      titleStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold), // Title text style
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Category(
                    imagePath: "assets/loudspeaker.png",
                    title: "Laporan Warga",
                    onTap: () => _onCategoryTap("Laporan Warga")),
                Category(
                    imagePath: "assets/newspaper.png",
                    title: "Berita",
                    onTap: () => _onCategoryTap("Berita")),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Category(
                    imagePath: "assets/tax.png",
                    title: "Pajak",
                    onTap: () => _onCategoryTap("Pajak")),
                Category(
                    imagePath: "assets/groceries.png",
                    title: "Harga Pangan",
                    onTap: () => _onCategoryTap("Harga Pangan")),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Category(
                    imagePath: "assets/bus.png",
                    title: "Transportasi Publik",
                    onTap: () => _onCategoryTap("Transportasi Publik")),
                Category(
                    imagePath: "assets/co2.png",
                    title: "Kondisi Udara",
                    onTap: () => _onCategoryTap("Kondisi Udara")),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Category(
                    imagePath: "assets/ambulance.png",
                    title: "Ambulan",
                    onTap: () => _onCategoryTap("Ambulan")),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Tutup",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold), // Action button text style
          ),
        ),
      ],
    );
  }

  void _onRecommendationTap(
      BuildContext context, Map<String, String> recommendation) {
    Get.to(() => BeritaDetailPage(recommendation: recommendation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFCF3), // Updated background color
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                    height: 140,
                    width: double.infinity,
                    color: Color(0xFF8D7B68)),
                Column(
                  children: [
                    SizedBox(height: 10),
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
                                    image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkM3XhaMlh-nREAy91vPL7N41VPszTKqZikw&s",
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Halo Irfan, Selamat datang!",
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Iconsax.notification5,
                              color: Colors.white,
                              size: 30,
                            ),
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
                            hintText: "Cari Berita",
                            prefixIcon: Icon(Iconsax.search_favorite),
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
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Category(
                      imagePath: "assets/loudspeaker.png",
                      title: "Laporan Warga",
                      onTap: () => _onCategoryTap("Laporan Warga")),
                  Category(
                      imagePath: "assets/newspaper.png",
                      title: "Berita",
                      onTap: () => _onCategoryTap("Berita")),
                  Category(
                      imagePath: "assets/tax.png",
                      title: "Pajak",
                      onTap: () => _onCategoryTap("Pajak")),
                  Category(
                      imagePath: "assets/groceries.png",
                      title: "Harga Pangan",
                      onTap: () => _onCategoryTap("Harga Pangan")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Category(
                      imagePath: "assets/bus.png",
                      title: "Transportasi Publik",
                      onTap: () => _onCategoryTap("Transportasi Publik")),
                  Category(
                      imagePath: "assets/co2.png",
                      title: "Kondisi Udara",
                      onTap: () => _onCategoryTap("Kondisi Udara")),
                  Category(
                      imagePath: "assets/ambulance.png",
                      title: "Ambulan",
                      onTap: () => _onCategoryTap("Ambulan")),
                  Category(
                      imagePath: "assets/menu.png",
                      title: "Lainnya",
                      onTap: () => _onCategoryTap("Lainnya")),
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: recommendations.map((recommendation) {
                  return GestureDetector(
                    onTap: () => _onRecommendationTap(context, recommendation),
                    child: Card(
                      color: Color(0xFFfffbf3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListTile(
                          leading: Container(
                            width: 50, // Adjusted width for better fit
                            height: 60, // Adjusted height for better fit
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                recommendation["image"]!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(recommendation["title"]!),
                          subtitle: Text(recommendation["subtitle"]!),
                          trailing: Icon(Icons.keyboard_arrow_right_sharp),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeritaPage extends StatelessWidget {
  final List<Map<String, String>> recommendations = [
    {
      "title": "Berita Terbaru",
      "subtitle": "Dapatkan berita terbaru setiap hari",
      "image": "assets/travel.jpg"
    },
    {
      "title": "Promo Hari Ini",
      "subtitle": "Cek promo menarik hari ini",
      "image": "assets/promo.jpg"
    },
    {
      "title": "Cuaca Terkini",
      "subtitle": "Informasi cuaca terbaru di daerahmu",
      "image": "assets/weather.jpg"
    },
    {
      "title": "Event Terdekat",
      "subtitle": "Cari tahu event yang akan datang",
      "image": "assets/event.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFCF3),
      appBar: AppBar(
        title: Text('Berita', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:
            Color(0xFF8D7B68), // Ubah warna background AppBar menjadi coklat
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() =>
                    BeritaDetailPage(recommendation: recommendations[index]));
              },
              child: Card(
                color: Color(0xFFFEFCF3),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(recommendations[index]["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    recommendations[index]["title"]!,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[
                          900], // Ubah warna teks judul menjadi coklat gelap
                    ),
                  ),
                  subtitle: Text(
                    recommendations[index]["subtitle"]!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.brown[
                            600]), // Ubah warna teks subtitle menjadi coklat lebih terang
                  ),
                  trailing: Icon(Iconsax.arrow_right_3,
                      color: Colors
                          .brown), // Ubah warna ikon trailing menjadi coklat
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BeritaDetailPage extends StatelessWidget {
  final Map<String, String> recommendation;

  BeritaDetailPage({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFCF3),
      appBar: AppBar(
        title: Text(recommendation["title"]!, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:
            Color(0xFF8D7B68),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              recommendation["image"]!,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15),
            Text(
              recommendation["title"]!,
              style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              recommendation["subtitle"]!,
              style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              "Deskripsi Berita:",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", // Gantilah dengan konten berita yang sebenarnya
              style: GoogleFonts.montserrat(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.brown[50], // Ubah warna background halaman menjadi coklat muda
      appBar: AppBar(
        title: Text('Profil', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:
            Colors.brown, // Ubah warna background AppBar menjadi coklat
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkM3XhaMlh-nREAy91vPL7N41VPszTKqZikw&s",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Irfan',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'test@gmail.com',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Jl. Kembang Kertas No. 123',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            leading: Icon(Iconsax.message),
            title: Text('Kirim Email'),
            onTap: () {
              // Implementasi aksi untuk mengirim email
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            leading: Icon(Iconsax.lock),
            title: Text('Ubah Kata Sandi'),
            onTap: () {
              // Implementasi aksi untuk mengubah kata sandi
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            leading: Icon(Iconsax.logout),
            title: Text('Keluar'),
            onTap: () {
              Get.offAllNamed(
                  "/login"); // Navigate to LoginView and remove all previous routes
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
        ],
      ),
    );
  }
}

class LaporanPage extends StatelessWidget {
  final List<Map<String, dynamic>> laporanList = [
    {
      "title": "Laporan Banjir",
      "content":
          "Hujan yang melanda DKI Jakarta dan sekitarnya pada Jumat (22/03) dini hari menyebabkan terjadinya sejumlah wilayah yang tergenang",
      "imagePath": "assets/flood.jpg",
    },
    {
      "title": "Laporan Kebakaran",
      "content":
          "Kebakaran rumah di Cakung Jakarta Timur membuat masyarakat sekitar panik. Pasalnya kebakaran terjadi pada siang hari. Mengetahui ada kebakaran rumah di Cakung Jakarta Timur, masyarakat setempat lantas menghubungi Petugas Damkar DKI Jakarta untuk membantu proses pemadaman api. Petugas yang menerima laporan adanya kebakaran rumah di Cakung Jakarta Timur lantas datang ke lokasi untuk memadamkan si jago merah. lantas apa penyebab kebakaran di Cakung Jakarta Timur tersebut?",
      "imagePath": "assets/fire.jpg",
    },
    {
      "title": "Laporan Kriminalitas",
      "content":
          "Tingkat kejahatan merupakan salah satu aspek kunci yang turut mempengaruhi keberhasilan pembangunan nasional. Tercipta dan terpenuhinya keamanan akan membangun suasana yang kondusif bagi masyarakat untuk melakukan berbagai aktivitas, termasuk aktivitas ekonomi dan sosial. Bagaimana perkembangan tingkat kejahatan di Indonesia selama pandemi?",
      "imagePath": "assets/crime.jpg",
    },
    {
      "title": "Laporan Kesehatan",
      "content":
          "Ada berbagai masalah kesehatan pada anak yang bisa ditangani oleh dokter pediatri. Mulai dari cedera atau luka pada anak, gangguan pada gigi anak, alergi, gangguan makan, gangguan tumbuh kembang, hingga saat anak mengalami demam tinggi. Penanganan tepat tentunya membuat kondisi anak menjadi lebih cepat pulih.",
      "imagePath": "assets/health.jpg",
    },
    {
      "title": "Laporan Pelayanan Publik",
      "content":
          "Ruang lingkup pelayanan publik dapat meliputi pelayanan barang dan jasa publik serta pelayanan administratif yang telah diatur dalam perundang-undangan. Untuk menjamin kelancaran penyelenggaraan pelayanan publik diperlukan Pembina dan penanggung jawab. Pembina tersebut terdiri atas pimpinan lembaga Negara, pimpinan kementerian, pimpinan lembaga pemerintah non kementerian, pimpinan lembaga komisi Negara atau yang sejenis, dan pimpinan lembaga lainnya. ",
      "imagePath": "assets/public_service.jpg",
    },
  ];

  void _showDetailLaporan(BuildContext context, Map<String, dynamic> laporan) {
    Get.to(() => DetailLaporanPage(laporan: laporan));
  }

  void _inputLaporan(BuildContext context) {
    Get.defaultDialog(
      title: "Input Laporan Baru",
      backgroundColor: Colors.brown[50],
      titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Judul Laporan",
                hintText: "Masukkan judul laporan",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Isi Laporan",
                hintText: "Masukkan isi laporan",
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Batal",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Implementasi untuk menyimpan laporan ke database atau proses lainnya
            Get.back();
          },
          child: Text("Simpan"),
        ),
      ],
    );
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
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _inputLaporan(context),
          ),
        ],
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
        backgroundColor:
            Colors.brown, // Ubah warna background AppBar menjadi coklat
      ),
      backgroundColor:
          Colors.brown[50], // Ubah warna background halaman menjadi coklat muda
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
