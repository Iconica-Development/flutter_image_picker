import 'package:flutter/material.dart';
import 'package:flutter_image_picker/image_picker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Image Picker Shows With Normal Theme', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Material(child: ImagePicker())));

    final titleFinder = find.text(const ImagePickerTheme().title);
    final makePhotoIconFinder =
        find.byIcon(const ImagePickerTheme().makePhotoIcon);
    final makePhotoTextFinder =
        find.text(const ImagePickerTheme().makePhotoText);
    final selectImageIconFinder =
        find.byIcon(const ImagePickerTheme().selectImageIcon);
    final selectImageTextFinder =
        find.text(const ImagePickerTheme().selectImageText);
    final closebuttonTextFinder =
        find.text(const ImagePickerTheme().closeButtonText);

    expect(titleFinder, findsOneWidget);
    expect(makePhotoIconFinder, findsOneWidget);
    expect(makePhotoTextFinder, findsOneWidget);
    expect(selectImageIconFinder, findsOneWidget);
    expect(selectImageTextFinder, findsOneWidget);
    expect(closebuttonTextFinder, findsOneWidget);
  });

  testWidgets('Image Picker Shows With Custom Theme', (tester) async {
    String title = "title";
    IconData makePhotoIcon = Icons.motorcycle;
    String makePhotoText = "taaaake image";
    IconData selectImageIcon = Icons.chevron_left;
    String selectImageText = "seleeeeect image";
    String closeButtonText = "Close Dialog!";

    await tester.pumpWidget(MaterialApp(
        home: Material(
            child: ImagePicker(
                imagePickerTheme: ImagePickerTheme(
                    title: title,
                    makePhotoIcon: makePhotoIcon,
                    makePhotoText: makePhotoText,
                    selectImageIcon: selectImageIcon,
                    selectImageText: selectImageText,
                    closeButtonText: closeButtonText)))));

    final titleFinder = find.text(title);
    final makePhotoIconFinder = find.byIcon(makePhotoIcon);
    final makePhotoTextFinder = find.text(makePhotoText);
    final selectImageIconFinder = find.byIcon(selectImageIcon);
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
