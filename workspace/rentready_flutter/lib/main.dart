import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentready_flutter/api/api_client.dart';
import 'package:rentready_flutter/localizations/Messages.dart';
import 'package:rentready_flutter/navigation/routes.dart';

void main() {
  // Lazy inject api dependency so the instance is created on first use
  Get.lazyPut(() => Api());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Flutter Demo',
      translations: Messages(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/',
      // home: AccountsPage(),
      locale: const Locale('en', 'US'), // Current locale of the app
      supportedLocales: const [Locale('en', 'US')], // All locales supported by the app
      debugShowCheckedModeBanner: false,
    );
  }
}
