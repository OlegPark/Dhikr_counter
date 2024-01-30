import 'package:dhikr_counter/pages/home/db_panel.dart';
import 'package:dhikr_counter/providers/tabs_provider.dart';
import 'package:provider/provider.dart';
import 'counter_panel.dart';
import 'package:flutter/material.dart';
import '../../constanst/constants.dart';
import 'top_panel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TabsProvider>();

    return Scaffold(
      backgroundColor: alphaWhite,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Column(
            children: [
              const TopPanel(),
              Visibility(visible: provider.isActive, child: const CounterPanel()),
              const DBPanel(),
            ],
          ),
        ), 
      ),
    );
  }
}