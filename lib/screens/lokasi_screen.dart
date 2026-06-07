import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

class LokasiScreen extends StatelessWidget {
  const LokasiScreen({super.key});

  // Fungsi untuk membuka link peta Google Maps eksternal
  Future<void> _bukaGoogleMaps() async {
    final Uri url = Uri.parse("https://maps.app.goo.gl/CbAK7X4udQHkB3bF7");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Tidak dapat membuka tautan peta.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lokasi")),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.map_outlined, size: 100, color: Colors.grey),
                SizedBox(height: 8),
                Text("Integrasi Google Maps / Jalur Navigasi Rute"),
              ],
            ),
          ),
          Positioned(
            bottom: 24, 
            left: 24, 
            right: 24,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Memanggil fungsi untuk membuka Google Maps saat tombol diklik
                  _bukaGoogleMaps();
                },
                child: const Text(
                  "Mulai Navigasi", 
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}