import 'package:flutter/material.dart';
import '../../constanst/constants.dart';
import 'top_panel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: alphaWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Column(
            children: [
              TopPanel(),
              SizedBox(height: 20,),
              Text('counter pabel'),
              Text('db panel'),
            ],
          ),
        ), 
      ),
    );
  }
}