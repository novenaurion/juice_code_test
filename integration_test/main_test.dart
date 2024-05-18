import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:juice_code_test/firebase_options.dart';
import 'package:juice_code_test/pages/add_name_page/add_name_page_controller.dart';
import 'package:juice_code_test/pages/get_image_page/get_image_page_controller.dart';
import 'package:juice_code_test/utils/constants/pages.dart';

import 'add_name_page_fail_test.dart';
import 'add_name_page_test.dart';
import 'detection_list_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    Get.lazyPut(() => AddNamePageController());
  });

  detectionListTest();

  addNameSuccessTest();

  addNameFailTest();

}
