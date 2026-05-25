import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final String nama;
  final String gambar;

  DetailPage({
    required this.nama,
    required this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset(
            gambar,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  nama,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Wisata terkenal di Desa Sumber Agung Bandar Lampung.",
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {},
                  child: Text("Lihat Lokasi"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}