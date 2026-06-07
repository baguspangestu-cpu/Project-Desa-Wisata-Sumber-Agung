import 'package:flutter/material.dart';

class TentangDesaScreen extends StatelessWidget {
  const TentangDesaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Desa"),
        backgroundColor: const Color(0xff4d7c44),
      ),
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Bagian Banner Gambar Utama
            Container(
              width: double.infinity,
              height: 340, 
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16.0), 
              child: Image.asset(
                "assets/Tentang_Desa.jpeg",
                fit: BoxFit.contain, 
              ),
            ),

            // 2. Bagian Konten Garis Pemisah dan Teks Deskripsi
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // GARIS PEMISAH SEBELUM TEKS
                  Divider(
                    height: 20, 
                    thickness: 1.5, 
                    color: Color(0xffe0e0e0),
                  ),
                  SizedBox(height: 12), // Jarak antara garis ke teks
                  
                  // Teks Deskripsi
                  Text(
                    "Desa Wisata Sumber Agung adalah desa dengan potensi wisata alam dan budaya yang menarik, seperti pemandangan sawah, perbukitan, dan sungai yang masih alami. Selain itu, masyarakatnya masih menjaga tradisi lokal dan memiliki berbagai produk UMKM. Desa ini dikembangkan sebagai destinasi wisata untuk meningkatkan ekonomi masyarakat sekaligus melestarikan lingkungan dan budaya.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      height: 1.6, 
                      fontSize: 15, 
                      fontWeight: FontWeight.w500, 
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}