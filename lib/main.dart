import 'package:flutter/material.dart';
import 'pages/home/home.dart';

void main() {
  runApp(const DhikrCounter());
}

class DhikrCounter extends StatelessWidget {
  const DhikrCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
