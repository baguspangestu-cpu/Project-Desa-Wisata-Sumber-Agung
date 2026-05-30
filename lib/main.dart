import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const DesaWisataApp());
}

class DesaWisataApp extends StatelessWidget {
  const DesaWisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desa Wisata Sumber Agung',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}