import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  const Custom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom'.tr())),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}