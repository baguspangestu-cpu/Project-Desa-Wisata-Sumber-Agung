import 'package:flutter/material.dart';
import '../constants.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event / Acara"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildEventItem(
                  "assets/Lengkung_Langit_Dua.jpg",
                  "Lengkung Langit 2",
                  "Saat resmi beroperasi sekitar September 2021 ada promo pembukaan dan pembukaan wisata baru.",
                ),
                _buildEventItem(
                  "assets/Kampung_vietnam.jpeg",
                  "Kampung Vietnam",
                  "Sering dipakai komunitas foto, konten kreator, gathering teman.",
                ),
                _buildEventItem(
                  "assets/Paraduta_hill.jpeg",
                  "Paraduta Hill",
                  "Hiburan musik sore atau malam sambil menikmati city view.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(String imagePath, String title, String desc) {
    // Mengecek apakah menggunakan asset lokal atau url internet
    final bool isAsset = imagePath.startsWith('assets/');

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: isAsset
                  ? Image.asset(
                      imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
                    )
                  : Image.network(
                      imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextDarkColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: kTextGreyColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget cadangan jika gambar gagal dimuat/salah path
  Widget _buildErrorImage() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey[300],
      child: const Center(
        child: Icon(Icons.broken_image, color: Colors.grey, size: 30),
      ),
    );
  }
}