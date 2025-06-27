// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import "package:flutter/material.dart";
import "package:flutter_image_picker/flutter_image_picker.dart"
    as iconica_image_picker;
import "package:flutter_image_picker/src/services/image_picker_service.dart";
import "package:flutter_test/flutter_test.dart";
import "package:image_picker/image_picker.dart" as image_picker;
import "package:mocktail/mocktail.dart";

class MockImageFilePickerService extends Mock
    implements ImageFilePickerService {}

class MockXFile extends Mock implements image_picker.XFile {}

class FakeImagePickerConfig extends Fake
    implements iconica_image_picker.ImagePickerConfig {}

void main() {
  // Setup mocks for XFile to be returned by the service
  late image_picker.XFile cameraImage;
  late image_picker.XFile galleryImage;
  late List<image_picker.XFile> galleryImages;

  setUpAll(() {
    // Register fallback values for any types used with `any()` in mocks.
    registerFallbackValue(FakeImagePickerConfig());
    registerFallbackValue(image_picker.ImageSource.gallery);
  });

  setUp(() {
    cameraImage = MockXFile();
    galleryImage = MockXFile();
    galleryImages = [MockXFile(), MockXFile()];
  });

  testWidgets("Image Picker Shows With Normal Theme", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(),
        ),
      ),
    );

    var makePhotoIconFinder = find.byIcon(Icons.camera_alt_rounded);
    var makePhotoTextFinder =
        find.text(const iconica_image_picker.ImagePickerTheme().makePhotoText);
    var selectImageIconFinder = find.byIcon(Icons.image);
    var selectImageTextFinder = find
        .text(const iconica_image_picker.ImagePickerTheme().selectImageText);
    var closebuttonTextFinder = find.text("Close");

    expect(makePhotoIconFinder, findsOneWidget);
    expect(makePhotoTextFinder, findsOneWidget);
    expect(selectImageIconFinder, findsOneWidget);
    expect(selectImageTextFinder, findsOneWidget);
    expect(closebuttonTextFinder, findsOneWidget);
  });

  testWidgets(
      "Image Picker Calls pickImage correctly When ImageSource Is Gallery",
      (tester) async {
    var serviceMock = MockImageFilePickerService();

    when(
      () => serviceMock.pickImage(
        image_picker.ImageSource.gallery,
        config: any(named: "config"),
      ),
    ).thenAnswer((_) async => galleryImage);

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(
            service: serviceMock,
            config: const iconica_image_picker.ImagePickerConfig(
              allowMultiple: false,
            ),
          ),
        ),
      ),
    );

    var finder = find.byKey(
      Key(const iconica_image_picker.ImagePickerTheme().selectImageText),
    );

    await tester.tap(finder);

    verify(
      () => serviceMock.pickImage(
        image_picker.ImageSource.gallery,
        config: any(named: "config"),
      ),
    ).called(1);

    verifyNever(() => serviceMock.pickMultiImage(config: any(named: "config")));
  });

  testWidgets(
      "Image Picker Calls pickImage correctly When ImageSource Is Camera",
      (tester) async {
    var serviceMock = MockImageFilePickerService();

    when(
      () => serviceMock.pickImage(
        image_picker.ImageSource.camera,
        config: any(named: "config"),
      ),
    ).thenAnswer(
      (_) async => cameraImage,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(
            service: serviceMock,
          ),
        ),
      ),
    );

    var finder = find.byKey(
      Key(const iconica_image_picker.ImagePickerTheme().makePhotoText),
    );

    await tester.tap(finder);

    verify(
      () => serviceMock.pickImage(
        image_picker.ImageSource.camera,
        config: any(named: "config"),
      ),
    ).called(1);
  });

  testWidgets(
      "Image Picker Calls pickMultiImage when allowMultiple is "
      "true and source is gallery", (tester) async {
    var serviceMock = MockImageFilePickerService();

    when(() => serviceMock.pickMultiImage(config: any(named: "config")))
        .thenAnswer((_) async => galleryImages);

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(
            service: serviceMock,
            config: const iconica_image_picker.ImagePickerConfig(
              allowMultiple: true,
            ),
          ),
        ),
      ),
    );

    var finder = find.byKey(
      Key(const iconica_image_picker.ImagePickerTheme().selectImageText),
    );

    await tester.tap(finder);

    verify(() => serviceMock.pickMultiImage(config: any(named: "config")))
        .called(1);
    verifyNever(
      () => serviceMock.pickImage(any(), config: any(named: "config")),
    );
  });

  testWidgets("Image Picker Shows With Custom Theme", (tester) async {
    Widget makePhotoIcon = Container(
      height: 125,
      width: 125,
      color: Colors.red,
    );
    var makePhotoText = "taaaake image";
    Widget selectImageIcon = Container(
      height: 125,
      width: 125,
      color: Colors.blue,
    );
    var selectImageText = "seleeeeect image";
    var closeButtonText = "Close";

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: iconica_image_picker.ImagePicker(
            theme: iconica_image_picker.ImagePickerTheme(
              makePhotoIcon: makePhotoIcon,
              makePhotoText: makePhotoText,
              selectImageIcon: selectImageIcon,
              selectImageText: selectImageText,
            ),
          ),
        ),
      ),
    );

    var makePhotoIconFinder = find.byWidget(makePhotoIcon);
    var makePhotoTextFinder = find.text(makePhotoText);
    var selectImageIconFinder = find.byWidget(selectImageIcon);
    var selectImageTextFinder = find.text(selectImageText);
    var closebuttonTextFinder = find.text(closeButtonText);

    expect(makePhotoIconFinder, findsOneWidget);
    expect(makePhotoTextFinder, findsOneWidget);
    expect(selectImageIconFinder, findsOneWidget);
    expect(selectImageTextFinder, findsOneWidget);
    expect(closebuttonTextFinder, findsOneWidget);
  });
}
