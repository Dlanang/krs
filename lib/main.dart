import 'package:flutter/material.dart';
import 'login_page.dart'; // Pastikan LoginPage Anda benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kuliah',
      theme: ThemeData(
        primaryColor: Colors.blueAccent, // Warna utama aplikasi
        scaffoldBackgroundColor:
            Colors.white, // Latar belakang putih untuk aplikasi
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent, // Warna AppBar
          titleTextStyle: TextStyle(
            color: Colors.white, // Teks putih pada AppBar
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, // Warna tombol
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(12), // Membuat border input lebih halus
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          labelStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500), // Label lebih jelas
        ),
      ),
      home: LoginPage(), // Pastikan LoginPage yang baru tetap di-load di sini
    );
  }
}
