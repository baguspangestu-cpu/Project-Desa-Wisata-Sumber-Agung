import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.white),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.terrain, size: 100, color: Color(0xFF4D8454)),
                const SizedBox(height: 16),
                const Text(
                  "DESA WISATA\nSUMBER AGUNG",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4D8454)),
                ),
                const Text("BANDAR LAMPUNG", style: TextStyle(letterSpacing: 2, fontSize: 12)),
                const SizedBox(height: 8),
                const Text("Desa Wisata, Destinasi Istimewa", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}