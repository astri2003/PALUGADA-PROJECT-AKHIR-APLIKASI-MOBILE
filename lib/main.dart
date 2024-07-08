import 'package:flutter/material.dart';
import 'package:palugada/splashscreen.dart';
import 'package:palugada/pages/login.dart';
import 'package:palugada/pages/home.dart';
import 'package:palugada/pages/sign_up.dart'; // Tambahkan import ini

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: SplashScreen(),
      routes: {
        '/login': (context) =>
            LoginScreen(), // Set the login screen as the initial route
        '/home': (context) => HomeScreen(),
        '/sign_up': (context) =>
            SignUpScreen(), // Tambahkan rute untuk halaman pendaftaran
      },
    );
  }
}
