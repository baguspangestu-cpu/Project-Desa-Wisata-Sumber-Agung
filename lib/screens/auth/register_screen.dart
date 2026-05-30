import 'package:flutter/material.dart';
import '../../constants.dart';
import 'success_register_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Buat Akun Baru", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text("Lengkapi data diri Anda", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),
              _buildInputField("Nama Lengkap", "Masukan nama lengkap"),
              _buildInputField("Email", "Masukan email"),
              _buildInputField("Password", "Buat Password", isPassword: true),
              _buildInputField("Konfirmasi Password", "Ulangi Password", isPassword: true),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessRegisterScreen()));
                  },
                  child: const Text("Daftar", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}