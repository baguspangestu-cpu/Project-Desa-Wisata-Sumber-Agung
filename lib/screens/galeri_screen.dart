import 'package:flutter/material.dart';

class GaleriScreen extends StatelessWidget {
  const GaleriScreen({super.key});

  // Menggunakan daftar nama file lokal Anda yang sudah disamakan formatnya
  final List<String> _fotoLokal = const [
    "assets/foto_1.jpg",
    "assets/foto_2.jpg",
    "assets/foto_3.jpeg",
    "assets/foto_4.jpeg",
    "assets/foto_5.jpg",
    "assets/foto_6.jpeg",
    "assets/foto_7.jpeg",
    "assets/foto_8.jpeg",
    "assets/foto_9.jpg",
    "assets/foto_10.jpg",
    "assets/foto_11.jpeg",
    "assets/foto_12.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeri Foto Wisatawan"),
        backgroundColor: const Color(0xff4d7c44),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        itemCount: _fotoLokal.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              _fotoLokal[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.grey),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}