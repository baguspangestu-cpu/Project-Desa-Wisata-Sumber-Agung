import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/wisata_model.dart';
import 'detail_wisata_screen.dart';

class DaftarWisataScreen extends StatelessWidget {
  const DaftarWisataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Wisata")),
      body: Column(
        children: [
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: ["Semua", "Alam", "Buatan", "Budaya"].map((kategori) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
                    label: Text(kategori),
                    backgroundColor: kategori == "Semua" ? kPrimaryColor : Colors.grey[200],
                    labelStyle: TextStyle(color: kategori == "Semua" ? Colors.white : Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarWisataDummy.length,
              itemBuilder: (context, index) {
                final item = daftarWisataDummy[index];
                return ListTile(
                  leading: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover)),
                  title: Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("${item.jamBuka}\n${item.hargaTiket}"),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailWisataScreen(wisata: item)));
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