import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/wisata_model.dart';
import 'lokasi_screen.dart';

class DetailWisataScreen extends StatelessWidget {
  final Wisata wisata;
  const DetailWisataScreen({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    // Cek secara dinamis apakah gambar menggunakan asset lokal atau url internet
    final bool isAsset = wisata.imageUrl.startsWith('assets/');

    // Mengonversi data int hargaTiket ke format teks agar serasi dan tidak error
    final stringHarga = wisata.hargaTiket == 0 ? "Sesuai Menu" : "Rp ${wisata.hargaTiket}";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Wisata"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MENAMPILKAN GAMBAR SECARA DINAMIS (Bisa Asset Lokal maupun Internet URL)
            isAsset
                ? Image.asset(
                    wisata.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                        ),
                      );
                    },
                  )
                : Image.network(
                    wisata.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                        ),
                      );
                    },
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
                  Text(
                    wisata.lokasi,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Deskripsi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    wisata.deskripsi,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jam Buka: ${wisata.jamBuka}"),
                      Text(
                        "Tiket: $stringHarga",
                        style: const TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LokasiScreen()),
                        );
                      },
                      child: const Text(
                        "Lihat Lokasi di Peta",
                        style: TextStyle(color: Colors.white),
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
}