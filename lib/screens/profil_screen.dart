import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Pengguna")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330")),
            const SizedBox(height: 16),
            const Text("Aura Azhar Naila", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("aura_azhar_naila@gmail.com", style: TextStyle(color: Colors.grey)),
            const Divider(height: 32),
            _buildProfileMenu(Icons.edit, "Edit Profil"),
            _buildProfileMenu(Icons.comment, "Ulasan Saya"),
            _buildProfileMenu(Icons.favorite, "Favorit Saya"),
            _buildProfileMenu(Icons.history, "Riwayat Kunjungan"),
            _buildProfileMenu(Icons.logout, "Keluar", color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenu(IconData icon, String title, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}