import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),

          SizedBox(height: 20),

          Text(
            "Aura Akbar Hello",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text("Pengunjung Desa Wisata"),
        ],
      ),
    );
  }
}