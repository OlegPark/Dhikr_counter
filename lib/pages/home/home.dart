import 'package:dhikr_counter/pages/home/db_panel.dart';
import 'counter_panel.dart';
import 'package:flutter/material.dart';
import '../../constanst/constants.dart';
import 'top_panel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: alphaWhite,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Column(
            children: [
              TopPanel(),
              CounterPanel(),
              DBPanel(),
            ],
          ),
        ), 
      ),
    );
  }
}