import 'package:dhikr_counter/hive/dhikr_adapter.dart';
import 'package:dhikr_counter/pages/custom/custom.dart';
import 'package:dhikr_counter/pages/settings/settings.dart';
import 'package:dhikr_counter/providers/counter_provider.dart';
import 'package:dhikr_counter/providers/hive_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'pages/home/home.dart';
import 'providers/tabs_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(DhikrAdapter());

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
        ChangeNotifierProvider(create: (_) => HiveProvider()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'Gilroy'),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const Settings(),
        ),
        GoRoute(
          path: 'custom',
          builder: (context, state) => const Custom(),
        ),
      ],
    ),
  ],
);
