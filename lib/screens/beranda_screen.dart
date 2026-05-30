import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/wisata_model.dart';
import 'detail_wisata_screen.dart';
import 'tentang_desa_screen.dart';
import 'daftar_wisata_screen.dart';
import 'event_screen.dart';
import 'galeri_screen.dart';
import 'lokasi_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Desa Wisata", style: TextStyle(color: Colors.white70)),
                      Text("Sumber Agung", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Bandar Lampung", style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                  const Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network("https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05", height: 180, width: double.infinity, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildMenuIcon(context, Icons.terrain, "Wisata", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DaftarWisataScreen()));
                          }),
                          _buildMenuIcon(context, Icons.event, "Event", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EventScreen()));
                          }),
                          _buildMenuIcon(context, Icons.image, "Galeri", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const GaleriScreen()));
                          }),
                          _buildMenuIcon(context, Icons.map, "Peta", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LokasiScreen()));
                          }),
                          _buildMenuIcon(context, Icons.info, "Tentang Desa", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TentangDesaScreen()));
                          }),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rekomendasi Wisata", style: kHeaderStyle),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const DaftarWisataScreen()));
                            }, 
                            child: const Text(
                              "Lihat Semua", 
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailWisataScreen(wisata: daftarWisataDummy[0])));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                                child: Image.network(daftarWisataDummy[0].imageUrl, width: 100, height: 100, fit: BoxFit.cover),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(daftarWisataDummy[0].nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text("Desa Sumber Agung", style: TextStyle(color: Colors.grey[600])),
                                    Row(
                                      children: const [
                                        Icon(Icons.star, color: Colors.amber, size: 16),
                                        Icon(Icons.star, color: Colors.amber, size: 16),
                                        Icon(Icons.star, color: Colors.amber, size: 16),
                                        Text(" 4.8", style: TextStyle(fontSize: 12)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(radius: 25, backgroundColor: Colors.grey[200], child: Icon(icon, color: kPrimaryColor)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}