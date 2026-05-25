import 'package:flutter/material.dart';

class GaleriPage extends StatelessWidget {

  final List gambar = [
    'assets/images/w1.jpg',
    'assets/images/w2.jpg',
    'assets/images/w3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: gambar.length,
      itemBuilder: (context, index) {
        return Card(
          child: Image.asset(
            gambar[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}