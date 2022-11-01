// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/flutter_image_picker.dart'
    as iconica_image_picker;
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/image_picker_service_mock.dart';

void main() {
  Uint8List cameraImage = Uint8List(10);
  Uint8List galleryImage = Uint8List(44);

  testWidgets('Image Picker Shows With Normal Theme', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(),
        ),
      ),
    );

    final titleFinder =
        find.text(const iconica_image_picker.ImagePickerTheme().title);
    final makePhotoIconFinder = find.byIcon(Icons.camera_alt_rounded);
    final makePhotoTextFinder =
        find.text(const iconica_image_picker.ImagePickerTheme().makePhotoText);
    final selectImageIconFinder = find.byIcon(Icons.image);
    final selectImageTextFinder = find
        .text(const iconica_image_picker.ImagePickerTheme().selectImageText);
    final closebuttonTextFinder = find
        .text(const iconica_image_picker.ImagePickerTheme().closeButtonText);

    expect(titleFinder, findsOneWidget);
    expect(makePhotoIconFinder, findsOneWidget);
    expect(makePhotoTextFinder, findsOneWidget);
    expect(selectImageIconFinder, findsOneWidget);
    expect(selectImageTextFinder, findsOneWidget);
    expect(closebuttonTextFinder, findsOneWidget);
  });

  testWidgets(
      'Image Picker Calls Function Correctly When ImageSource Is Gallery',
      (tester) async {
    ImagePickerServiceMock serviceMock = ImagePickerServiceMock();

    when(() => serviceMock.pickImage(image_picker.ImageSource.gallery))
        .thenAnswer((_) => Future.value(galleryImage));

    await tester.pumpWidget(MaterialApp(
        home: Material(
            child: iconica_image_picker.ImagePicker(
                imagePickerService: serviceMock))));

    Finder finder = find.byKey(
        Key(const iconica_image_picker.ImagePickerTheme().selectImageText));

    await tester.tap(finder);

    verify(() => serviceMock.pickImage(image_picker.ImageSource.gallery))
        .called(1);
  });

  testWidgets(
      'Image Picker Calls Function Correctly When ImageSource Is Camera',
      (tester) async {
    ImagePickerServiceMock serviceMock = ImagePickerServiceMock();

    when(() => serviceMock.pickImage(image_picker.ImageSource.camera))
        .thenAnswer((_) => Future.value(cameraImage));

    await tester.pumpWidget(MaterialApp(
        home: Material(
            child: iconica_image_picker.ImagePicker(
                imagePickerService: serviceMock))));

    Finder finder = find.byKey(
        Key(const iconica_image_picker.ImagePickerTheme().makePhotoText));

    await tester.tap(finder);

    verify(() => serviceMock.pickImage(image_picker.ImageSource.camera))
        .called(1);
  });

  testWidgets('Image Picker Shows With Custom Theme', (tester) async {
    String title = "title";
    Widget makePhotoIcon = Container(
      height: 125,
      width: 125,
      color: Colors.red,
    );
    String makePhotoText = "taaaake image";
    Widget selectImageIcon = Container(
      height: 125,
      width: 125,
      color: Colors.blue,
    );
    String selectImageText = "seleeeeect image";
    String closeButtonText = "Close Dialog!";

    await tester.pumpWidget(MaterialApp(
        home: Material(
            child: iconica_image_picker.ImagePicker(
                imagePickerTheme: iconica_image_picker.ImagePickerTheme(
                    title: title,
                    makePhotoIcon: makePhotoIcon,
                    makePhotoText: makePhotoText,
                    selectImageIcon: selectImageIcon,
                    selectImageText: selectImageText,
                    closeButtonText: closeButtonText)))));

    final titleFinder = find.text(title);
    final makePhotoIconFinder = find.byWidget(makePhotoIcon);
    final makePhotoTextFinder = find.text(makePhotoText);
    final selectImageIconFinder = find.byWidget(selectImageIcon);
    final selectImageTextFinder = find.text(selectImageText);
    final closebuttonTextFinder = find.text(closeButtonText);

    expect(titleFinder, findsOneWidget);
    expect(makePhotoIconFinder, findsOneWidget);
    expect(makePhotoTextFinder, findsOneWidget);
    expect(selectImageIconFinder, findsOneWidget);
    expect(selectImageTextFinder, findsOneWidget);
    expect(closebuttonTextFinder, findsOneWidget);
  });
}
