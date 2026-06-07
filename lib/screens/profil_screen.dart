import 'package:flutter/material.dart';
// MENYESUAIKAN IMPORT KE HALAMAN LOGIN ANDA BERDASARKAN STRUKTUR FOLDER PROJECT
import 'auth/login_screen.dart'; 

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  String _namaPengguna = "Aura Azhar Naila";
  String _emailPengguna = "aura_azhar_naila@gmail.com";

  void _tampilkanDialogEditProfil() {
    final TextEditingController namaController = TextEditingController(text: _namaPengguna);
    final TextEditingController emailController = TextEditingController(text: _emailPengguna);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profil", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama Lengkap"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff4d7c44)),
              onPressed: () {
                setState(() {
                  _namaPengguna = namaController.text;
                  _emailPengguna = emailController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profil berhasil diperbarui!")),
                );
              },
              child: const Text("Simpan", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  // FUNGSI KELUAR UNTUK KEMBALI KE LOGIN_SCREEN ANDA
  void _keHalamanLogin() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()), // Mengarah ke class LoginScreen Anda
      (route) => false, // Menghapus tumpukan halaman agar tidak bisa klik "Back" kembali ke profil
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Pengguna"),
        backgroundColor: const Color(0xff4d7c44),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // FOTO PROFIL (Sudah diganti menggunakan assets lokal sesuai gambar yang Anda kirim)
            const CircleAvatar(
              radius: 50, 
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/Foto_Aura.jpeg"), // Memanggil file gambar Foto_Aura.jpeg
            ),
            const SizedBox(height: 16),
            Text(
              _namaPengguna, 
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _emailPengguna, 
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(height: 32),
            _buildProfileMenu(Icons.edit, "Edit Profil", onTap: () {
              _tampilkanDialogEditProfil();
            }),
            _buildProfileMenu(Icons.comment, "Ulasan Saya", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UlasanSayaScreen()));
            }),
            _buildProfileMenu(Icons.favorite, "Favorit Saya", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritSayaScreen()));
            }),
            _buildProfileMenu(Icons.history, "Riwayat Kunjungan", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RiwayatKunjunganScreen()));
            }),
            _buildProfileMenu(Icons.logout, "Keluar", color: Colors.red, onTap: () {
              _keHalamanLogin(); // Memanggil fungsi navigasi kembali ke login
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenu(IconData icon, String title, {Color color = Colors.black, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// ==========================================
// HALAMAN SUB-MENU (UNTUK NAVIGASI KLIK)
// ==========================================

class UlasanSayaScreen extends StatelessWidget {
  const UlasanSayaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ulasan Saya"), backgroundColor: const Color(0xff4d7c44)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Lengkung Langit 2", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Tempatnya sejuk banget, banyak spot foto bagus dan instagramable!"),
              trailing: Icon(Icons.star, color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritSayaScreen extends StatelessWidget {
  const FavoritSayaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorit Saya"), backgroundColor: const Color(0xff4d7c44)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.pin_drop, color: Colors.red),
              title: Text("Lengkung Langit 2", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Kec. Kemiling, Bandar Lampung"),
            ),
          ),
        ],
      ),
    );
  }
}

class RiwayatKunjunganScreen extends StatelessWidget {
  const RiwayatKunjunganScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riwayat Kunjungan"), backgroundColor: const Color(0xff4d7c44)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.calendar_month, color: Color(0xff4d7c44)),
              title: Text("Lengkung Langit 2", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Dikunjungi pada: 08 Juni 2026"),
            ),
          ),
        ],
      ),
    );
  }
}