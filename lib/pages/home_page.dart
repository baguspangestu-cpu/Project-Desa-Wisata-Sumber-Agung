import 'package:flutter/material.dart';
import 'wisata_page.dart';
import 'event_page.dart';
import 'galeri_page.dart';
import 'profil_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;

  final pages = [
    WisataPage(),
    EventPage(),
    GaleriPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Desa Wisata Sumber Agung"),
      ),

      drawer: Drawer(
        child: ListView(
          children: [

            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Aura Akbar Hello",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
            ),

            ListTile(
              leading: Icon(Icons.map),
              title: Text("Wisata"),
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text("Tentang Desa"),
            ),
          ],
        ),
      ),

      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.green,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Event",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: "Galeri",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}