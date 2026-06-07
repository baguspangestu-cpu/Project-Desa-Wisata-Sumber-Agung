import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/wisata_model.dart';
import 'detail_wisata_screen.dart';

class DaftarWisataScreen extends StatelessWidget {
  const DaftarWisataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat list baru berdasarkan data dummy, lalu memperbarui data Lengkung Langit, Kampung Vietnam, dan Paraduta Hill
    final List<Wisata> semuaWisata = daftarWisataDummy.map((item) {
      if (item.nama.contains("Lengkung Langit")) {
        return Wisata(
          nama: item.nama,
          lokasi: item.lokasi,
          deskripsi: item.deskripsi,
          imageUrl: "assets/Lengkung_Langit_Dua.jpg", // Menggunakan path asset lokal Anda
          jamBuka: item.jamBuka,
          hargaTiket: item.hargaTiket,
          rating: item.rating,
          ulasan: item.ulasan,
          kategori: item.kategori,
        );
      } else if (item.nama.contains("Kampung Vietnam")) {
        return Wisata(
          nama: item.nama,
          lokasi: item.lokasi,
          deskripsi: item.deskripsi,
          imageUrl: "assets/Kampung_vietnam.jpeg", // Menggunakan path asset lokal Anda
          jamBuka: item.jamBuka,
          hargaTiket: item.hargaTiket,
          rating: item.rating,
          ulasan: item.ulasan,
          kategori: item.kategori,
        );
      } else if (item.nama.contains("Paraduta Hill")) {
        return Wisata(
          nama: item.nama,
          lokasi: item.lokasi,
          deskripsi: item.deskripsi,
          imageUrl: "assets/Paraduta_hill.jpeg", // Menggunakan path asset lokal Anda yang baru
          jamBuka: item.jamBuka,
          hargaTiket: item.hargaTiket,
          rating: item.rating,
          ulasan: item.ulasan,
          kategori: item.kategori,
        );
      }
      return item;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Wisata")),
      body: Column(
        children: [
          // Kolom Pencarian Destinasi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Cari destinasi impianmu...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          
          // Bagian Daftar Wisata Langsung
          Expanded(
            child: ListView.builder(
              itemCount: semuaWisata.length,
              itemBuilder: (context, index) {
                final item = semuaWisata[index];
                
                // Mengonversi data int hargaTiket ke format teks "Rp" agar tidak error
                final stringHarga = item.hargaTiket == 0 ? "Sesuai Menu" : "${item.hargaTiket}";

                // Cek apakah gambar menggunakan asset lokal atau link internet URL
                final bool isAsset = item.imageUrl.startsWith('assets/');

                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8), 
                    child: isAsset
                        ? Image.asset(
                            item.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image, color: Colors.grey),
                              );
                            },
                          )
                        : Image.network(
                            item.imageUrl, 
                            width: 60, 
                            height: 60, 
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image, color: Colors.grey),
                              );
                            },
                          ),
                  ),
                  title: Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("${item.jamBuka}\n$stringHarga"),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    onPressed: () {
                      // Mengirim data item yang sudah diperbarui gambarnya ke DetailWisataScreen
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => DetailWisataScreen(wisata: item)),
                      );
                    },
                    child: const Text("Detail", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}