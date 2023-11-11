import 'package:flutter/material.dart';
import 'package:pcv/screens/home_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/sign_in_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: const HomeScreen(),
    );
  }
}
