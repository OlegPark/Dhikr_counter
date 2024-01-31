import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings'
          ),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.push('/');
              },
              child: const Text('Вперед'),
            ),
            const Text('Settings'),
          ],
        ),
      ),
    );
  }
}