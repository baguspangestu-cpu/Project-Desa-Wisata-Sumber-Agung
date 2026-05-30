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
                  "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
                  "Lengkung Langit 2",
                  "Saat resmi beroperasi sekitar September 2021 ada promo pembukaan dan pembukaan wisata baru.",
                ),
                _buildEventItem(
                  "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05",
                  "Kampung Vietnam",
                  "Sering dipakai komunitas foto, konten kreator, gathering teman.",
                ),
                _buildEventItem(
                  "https://images.unsplash.com/photo-1501854140801-50d01698950b",
                  "Pintu Langit",
                  "Hiburan musik sore atau malam sambil menikmati city view.",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: const Text("Lihat Semua Event", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(String imageUrl, String title, String desc) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16), // DI SINI PERBAIKAN UTAMANYA
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
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
}