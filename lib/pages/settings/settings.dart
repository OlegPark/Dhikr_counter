import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final locales = EasyLocalization.of(context)?.supportedLocales ??
      const [
        Locale('en'),
        Locale('ru'),
        Locale('es'),
      ];


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'.tr()
          ),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Go Home'.tr()),
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
            const SizedBox(height: 20,),
            ListTile(
              tileColor: Colors.white,
              title: Text('Language'.tr()),
              leading: const Icon(
                CupertinoIcons.globe,
                color: Colors.black,
              ),
              trailing: FilledButton(
                child: Text(
                  launguageMap[context.locale.languageCode] ??
                    context.locale.languageCode,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.swipe_down),
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView(
                              children: locales.map((Locale locale) {
                                return ListTile(
                                  title: Column(
                                    children: [
                                      Text(launguageMap[locale.languageCode] ??
                                          locale.languageCode,),
                                      const Divider(),
                                    ],
                                  ),
                                  onTap: () {
                                    EasyLocalization.of(context)
                                        ?.setLocale(locale);

                                    Navigator.pop(context);
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Map<String, String> launguageMap ={
  'en': 'English',
  'es': 'Español',
  'ru': 'Русский',
};

Future<FirebaseRemoteConfig> setupRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.fetchAndActivate();

    return remoteConfig;
}
