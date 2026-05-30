import 'package:flutter/material.dart';

class GaleriScreen extends StatelessWidget {
  const GaleriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galeri Foto")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network("https://images.unsplash.com/photo-1501854140801-50d01698950b", fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}