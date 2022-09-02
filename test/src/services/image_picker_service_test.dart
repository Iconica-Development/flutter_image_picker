// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_image_picker/src/services/image_picker_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../mocks/image_picker_mock.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

//   late ImagePickerMock imagePickerMock;
//   late ImagePickerService sut;

//   setUp(() {
//     imagePickerMock = ImagePickerMock();
//     sut = ImagePickerService();
//   });

//   group("Image Picker Test with camera option", () {
//     setUp(() {
//       imagePickerMock = ImagePickerMock();
//       sut = ImagePickerService();
//     });
//     test("When function called with Camera parameter returns correct picture",
//         () async {
//       // Setup the neccesary variables to test
//       XFile? xFile = XFile("Test", bytes: Uint8List(50));

//       // //Mock the pickImage function of the image picker to return an image
//       when(() => imagePickerMock.pickImage(source: ImageSource.gallery))
//           .thenAnswer((_) => Future.value(xFile));

//       // Execute test
//       var image = await sut.pickImage(ImageSource.gallery);

//       // //Assert test
//       expect(image, Uint8List(50));
//     });
//   });

//   group("Image Picker Widget with gallery option", () {});
// }
