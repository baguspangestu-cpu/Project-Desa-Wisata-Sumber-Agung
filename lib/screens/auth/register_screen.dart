import 'package:flutter/material.dart';
import '../../constants.dart';
import 'success_register_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Menambahkan state visibilitas terpisah untuk masing-masing field password
  bool _obscurePassword = true;
  bool _obscureKonfirmasiPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Buat Akun Baru", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text("Lengkapi data diri Anda", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),
              
              // Input Nama & Email (Bukan Password)
              _buildInputField("Nama Lengkap", "Masukan nama lengkap"),
              _buildInputField("Email", "Masukan email"),
              
              // Input Password dengan tombol visibilitas terikat ke state '_obscurePassword'
              _buildInputField(
                "Password", 
                "Buat Password", 
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              
              // Input Konfirmasi Password dengan tombol visibilitas terikat ke state '_obscureKonfirmasiPassword'
              _buildInputField(
                "Konfirmasi Password", 
                "Ulangi Password", 
                isPassword: true,
                obscureText: _obscureKonfirmasiPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureKonfirmasiPassword = !_obscureKonfirmasiPassword;
                  });
                },
              ),
              
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessRegisterScreen()));
                  },
                  child: const Text("Daftar", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Mengubah parameter fungsi pembangun agar menerima status obscure dan aksi klik terpisah
  Widget _buildInputField(
    String label, 
    String hint, {
    bool isPassword = false, 
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            obscureText: isPassword ? obscureText : false,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: onToggleVisibility,
                    )
                  : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}