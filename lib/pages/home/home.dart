import 'counter_panel.dart';
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
              CounterPanel(),
              Text('db panel'),
            ],
          ),
        ), 
      ),
    );
  }
}