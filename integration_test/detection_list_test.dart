import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:juice_code_test/main.dart' as app;

Future<void> detectionListTest() async {
  testWidgets('User Should See the user lists', (tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.text('Detections Lists'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('detection-list')), findsOneWidget);

  });
}
