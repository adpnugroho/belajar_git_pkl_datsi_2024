import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap; // Menambahkan onTap

  const Category({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap, // Menambahkan onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menambahkan onTap handler
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 48, // Menambah lebar untuk memastikan teks tidak terpotong
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 31,
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(fontSize: 8.3),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow
                        .ellipsis, // Mengganti overflow dengan ellipsis jika terlalu panjang
                    maxLines: 3, // Menambah batas maksimal baris jika diperlukan
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
