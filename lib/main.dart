// ignore_for_file: unused_import

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:pfr/pages/auth/auth_page.dart';
import 'package:pfr/pages/dashboard/dashboard_page.dart';
import 'package:pfr/pages/purpose/purpose_page.dart';
import 'package:pfr/routes/app_pages.dart';
import 'package:pfr/utils/firebase_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseHelper.connect();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ПФР - Обращения',
      theme: FlexThemeData.light(
        scheme: FlexScheme.blue,
        scaffoldBackground: Colors.grey.shade100,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.initialRoute,
    );
  }
}
