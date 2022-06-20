import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rr_qasim_assign/localizations/Messages.dart';
import 'package:rr_qasim_assign/navigation/routes.dart';

void main() {
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
