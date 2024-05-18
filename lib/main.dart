import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juice_code_test/pages/DetectionListPage/detection_list_page.dart';
import 'package:juice_code_test/utils/constants/pages.dart';
import 'package:juice_code_test/utils/constants/themes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.light,
      title: "Juice Code Test",
      initialRoute: DetectionListPage.route,
      getPages: AppPage.pages,
      defaultTransition: Transition.fadeIn,
    );
  }
}
