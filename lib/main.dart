import 'package:flutter/material.dart';

void main() {
  runApp(const DhikrCounter());
}

class DhikrCounter extends StatelessWidget {
  const DhikrCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    width: 54,
                    height: 38,
                    color: Colors.grey,
                  ),
                ],
              ),
              Text('saf'),
              Text('saf'),
              Text('saf'),
              Text('saf'),
            ],
          ),
        ), 
      ),
    );
  }
}