import 'package:flutter/material.dart';

void main() {
  runApp(const DhikrCounter());
}

const alphaBlue = Color(0xFF4664FF);
const alphaWhite = Color(0xFFF9F9F9);
const alphaBlack = Color(0xFF232323);
const alphaGrey = Color(0xFF9F9F9F);

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
      backgroundColor: alphaWhite,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: 38,
                    ),
                  ),
                  Container(
                    width: 54,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    margin: const EdgeInsets.only(left: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Text('top panel'),
              const Text('counter pabel'),
              const Text('db panel'),
            ],
          ),
        ), 
      ),
    );
  }
}