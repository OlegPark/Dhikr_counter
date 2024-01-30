import 'package:dhikr_counter/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home/home.dart';
import 'providers/tabs_provider.dart';

void main() {
  runApp(const DhikrCounter());
}

class DhikrCounter extends StatelessWidget {
  const DhikrCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => TabsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Gilroy'),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
