import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
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
                context.go('/');
              },
              child: const Text('Вперед'),
            ),
            FutureBuilder(
              future: setupRemoteConfig(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const CupertinoActivityIndicator();
                }
                return Text(snapshot.data?.getString('hello_text') ?? '');
              }
            ),
          ],
        ),
      ),
    );
  }
}

Future<FirebaseRemoteConfig> setupRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.fetchAndActivate();

    return remoteConfig;
}