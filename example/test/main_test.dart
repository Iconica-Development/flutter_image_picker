import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets("Test Main widget", ((WidgetTester tester) async {
    // Initialization
    final openImagePickerButton = find.byKey(const ValueKey("PickImageButton"));

    // Execute Test
    await tester.pumpWidget(const MaterialApp(
        home:
            ImagePickerExampleHomePage(title: 'Flutter Image Picker Example')));
    await tester.tap(openImagePickerButton);
    await tester.pump();

    // Check Result
    // expect(, findsOneWidget);
  }));
}
