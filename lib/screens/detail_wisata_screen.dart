import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/wisata_model.dart';

class DetailWisataScreen extends StatelessWidget {
  final Wisata wisata;

  const DetailWisataScreen({super.key, required this.wisata});

  // Fungsi untuk membuka Google Maps secara akurat menggunakan URL eksternal resmi
  Future<void> _bukaGoogleMaps(String namaTempat, String alamat) async {
    final String query = Uri.encodeComponent("$namaTempat, $alamat");
    final Uri url = Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Tidak dapat membuka Google Maps untuk $namaTempat');
    }
  }

  @override
  Widget build(BuildContext context) {
    // PERBAIKAN LOGIKA UTAMA: Mengecek apakah nama mengandung kata "Lengkung Langit"
    // agar fleksibel jika ditulis "Lengkung Langit 2" maupun "Lengkung Langit Dua"
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
            // MENAMPILKAN GAMBAR SECARA DINAMIS (Bisa Asset Lokal maupun Internet URL)
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
                        wisata.hargaTiket == 0 ? "Sesuai Menu" : "Tiket:${wisata.hargaTiket}",
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
                        _bukaGoogleMaps(wisata.nama, wisata.lokasi);
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