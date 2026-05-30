import 'package:flutter/material.dart';
import '../constants.dart';

class TentangDesaScreen extends StatelessWidget {
  const TentangDesaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Desa")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(Icons.terrain, size: 80, color: kPrimaryColor),
            const Text("DESA WISATA SUMBER AGUNG", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(height: 32),
            const Text(
              "Desa Wisata Sumber Agung adalah desa dengan potensi wisata alam dan budaya yang menarik, seperti pemandangan sawah, perbukitan, dan sungai yang masih alami. Selain itu, masyarakatnya masih menjaga tradisi lokal dan memiliki berbagai produk UMKM. Desa ini dikembangkan sebagai destinasi wisata untuk meningkatkan ekonomi masyarakat sekaligus melestarikan lingkungan dan budaya.",
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}