import 'package:flutter/material.dart';
import 'detail_page.dart';

class WisataPage extends StatelessWidget {

  final List wisata = [
    {
      "nama": "Lengkung Langit",
      "gambar": "assets/images/w1.jpg"
    },

    {
      "nama": "Puncak Mas",
      "gambar": "assets/images/w2.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wisata.length,
      itemBuilder: (context, index) {

        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(

            leading: Image.asset(
              wisata[index]['gambar'],
              width: 70,
              fit: BoxFit.cover,
            ),

            title: Text(wisata[index]['nama']),

            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      nama: wisata[index]['nama'],
                      gambar: wisata[index]['gambar'],
                    ),
                  ),
                );
              },
              child: Text("Detail"),
            ),
          ),
        );
      },
    );
  }
}