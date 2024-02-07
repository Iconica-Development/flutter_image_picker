// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/flutter_image_picker.dart'
    as iconica_image_picker;
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:mocktail/mocktail.dart';

import 'mocks/image_picker_service_mock.dart';

void main() {
  var cameraImage = Uint8List(10);
  var galleryImage = Uint8List(44);

  testWidgets('Image Picker Shows With Normal Theme', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(),
        ),
      ),
    );

    var titleFinder =
        find.text(const iconica_image_picker.ImagePickerTheme().title);
    var makePhotoIconFinder = find.byIcon(Icons.camera_alt_rounded);
    var makePhotoTextFinder =
        find.text(const iconica_image_picker.ImagePickerTheme().makePhotoText);
    var selectImageIconFinder = find.byIcon(Icons.image);
    var selectImageTextFinder = find
        .text(const iconica_image_picker.ImagePickerTheme().selectImageText);
    var closebuttonTextFinder = find
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
    var serviceMock = ImagePickerServiceMock();

    when(() => serviceMock.pickImage(image_picker.ImageSource.gallery))
        .thenAnswer((_) => Future.value(galleryImage));

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(
            imagePickerService: serviceMock,
          ),
        ),
      ),
    );

    var finder = find.byKey(
      Key(const iconica_image_picker.ImagePickerTheme().selectImageText),
    );

    await tester.tap(finder);

    verify(() => serviceMock.pickImage(image_picker.ImageSource.gallery))
        .called(1);
  });

  testWidgets(
      'Image Picker Calls Function Correctly When ImageSource Is Camera',
      (tester) async {
    var serviceMock = ImagePickerServiceMock();

    when(() => serviceMock.pickImage(image_picker.ImageSource.camera))
        .thenAnswer((_) => Future.value(cameraImage));

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(
            imagePickerService: serviceMock,
          ),
        ),
      ),
    );

    var finder = find.byKey(
      Key(const iconica_image_picker.ImagePickerTheme().makePhotoText),
    );

    await tester.tap(finder);

    verify(() => serviceMock.pickImage(image_picker.ImageSource.camera))
        .called(1);
  });

  testWidgets('Image Picker Shows With Custom Theme', (tester) async {
    var title = 'title';
    Widget makePhotoIcon = Container(
      height: 125,
      width: 125,
      color: Colors.red,
    );
    var makePhotoText = 'taaaake image';
    Widget selectImageIcon = Container(
      height: 125,
      width: 125,
      color: Colors.blue,
    );
    var selectImageText = 'seleeeeect image';
    var closeButtonText = 'Close Dialog!';

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(
            imagePickerTheme: iconica_image_picker.ImagePickerTheme(
              title: title,
              makePhotoIcon: makePhotoIcon,
              makePhotoText: makePhotoText,
              selectImageIcon: selectImageIcon,
              selectImageText: selectImageText,
              closeButtonText: closeButtonText,
            ),
          ),
        ),
      ),
    );

    var titleFinder = find.text(title);
    var makePhotoIconFinder = find.byWidget(makePhotoIcon);
    var makePhotoTextFinder = find.text(makePhotoText);
    var selectImageIconFinder = find.byWidget(selectImageIcon);
    var selectImageTextFinder = find.text(selectImageText);
    var closebuttonTextFinder = find.text(closeButtonText);

    expect(titleFinder, findsOneWidget);
    expect(makePhotoIconFinder, findsOneWidget);
    expect(makePhotoTextFinder, findsOneWidget);
    expect(selectImageIconFinder, findsOneWidget);
    expect(selectImageTextFinder, findsOneWidget);
    expect(closebuttonTextFinder, findsOneWidget);
  });
}
