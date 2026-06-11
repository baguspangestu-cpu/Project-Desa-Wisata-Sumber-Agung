import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/wisata_model.dart';

class DetailWisataScreen extends StatelessWidget {
  final Wisata wisata;

  const DetailWisataScreen({super.key, required this.wisata});

  // KODE PERBAIKAN: Menggunakan URL Intent Universal Google Maps resmi yang stabil untuk Android
  Future<void> _bukaGoogleMaps(BuildContext context, String namaTempat, String alamat) async {
    // 1. Membuat query pencarian teks yang aman dari karakter spasi/khusus
    final String searchQuery = Uri.encodeComponent("$namaTempat, $alamat");
    
    // 2. Menggunakan URL universal resmi. Sistem Android akan otomatis menawarkan/membuka aplikasi Google Maps bawaan HP
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$searchQuery");

    try {
      if (await canLaunchUrl(googleMapsUrl)) {
        await launchUrl(
          googleMapsUrl, 
          mode: LaunchMode.externalApplication, // Wajib menggunakan externalApplication agar dilempar ke aplikasi luar
        );
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Google Maps tidak menanggapi permintaan lokasi ini.")),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal memuat peta: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mengecek apakah nama mengandung kata "Lengkung Langit"
    final String targetImageUrl = (wisata.nama.contains("Lengkung Langit"))
        ? "assets/Lengkung_Langit_Dua.jpg"
        : wisata.imageUrl;

    // Cek secara dinamis apakah gambar menggunakan asset lokal atau url internet
    final bool isAsset = targetImageUrl.startsWith('assets/');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Wisata"),
        backgroundColor: const Color(0xff4d7c44),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MENAMPILKAN GAMBAR SECARA DINAMIS
            SizedBox(
              width: double.infinity,
              height: 250,
              child: isAsset
                  ? Image.asset(
                      targetImageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
                    )
                  : Image.network(
                      targetImageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
                    ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.nama,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    wisata.lokasi,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    wisata.deskripsi,
                    style: const TextStyle(fontSize: 14, height: 1.4),
                  ),
                  const SizedBox(height: 16),

                  // Info Jam Buka dan Tiket Masuk
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jam Buka: ${wisata.jamBuka}",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        wisata.hargaTiket == 0 ? "Sesuai Menu" : "Tiket: ${wisata.hargaTiket}",
                        style: const TextStyle(
                          fontSize: 14, 
                          fontWeight: FontWeight.bold, 
                          color: Color(0xff4d7c44),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Tombol "Lihat Lokasi di Peta"
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4d7c44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        // Meneruskan BuildContext ke fungsi untuk keamanan widget mounted
                        _bukaGoogleMaps(context, wisata.nama, wisata.lokasi);
                      },
                      child: const Text(
                        "Lihat Lokasi di Peta",
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _buildErrorImage() {
    return Container(
      color: Colors.grey[300],
      child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
    );
  }
}