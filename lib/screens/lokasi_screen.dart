import 'package:flutter/material.dart';
import '../constants.dart';

class LokasiScreen extends StatelessWidget {
  const LokasiScreen({super.key});

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
                Text("Integrasi Google Maps / Jalur Navigasi Rute"),
              ],
            ),
          ),
          Positioned(
            bottom: 24, left: 24, right: 24,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                onPressed: () {},
                child: const Text("Mulai Navigasi", style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}