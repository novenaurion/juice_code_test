import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:juice_code_test/pages/DetectionListPage/detection_list_page.dart';
import 'package:juice_code_test/pages/add_name_page/add_name_page.dart';
import 'package:juice_code_test/pages/get_image_page/get_image_page.dart';
import 'package:juice_code_test/utils/constants/pages.dart';
import 'package:juice_code_test/utils/constants/themes.dart';

Future<void> addNameSuccessTest() async {
  testWidgets('The user should be able to add name ', (tester) async {
    await tester.pumpWidget(GetMaterialApp(
      theme: AppThemes.light,
      title: "Juice Code Test",
      initialRoute: AddNamePage.route,
      getPages: AppPage.pages,
      defaultTransition: Transition.fadeIn,
    ));

    await tester.pumpAndSettle();

    expect(find.byKey(Key('image-view')), findsOneWidget);

    var textFormField = find.byKey(Key("enter-name-field"));
    expect(textFormField, findsOneWidget);

    await tester.enterText(textFormField, "Test Name " + DateTime.now().timeZoneName);

    await tester.pumpAndSettle();

    var addButton = find.byKey(Key("add-button"));
    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pump();

    expect(find.byKey(Key('loading-dialog')), findsOneWidget);

    await tester.pump(Duration(seconds:5));

    expect(find.byKey(Key('error-success-dialog')), findsOneWidget);

    var confirmButtonDialog = find.byKey(Key('confirm-button'));

    expect(confirmButtonDialog, findsOneWidget);
    await tester.tap(confirmButtonDialog);
    await tester.pumpAndSettle();

    expect(find.byType(DetectionListPage), findsOneWidget);
  });
}
