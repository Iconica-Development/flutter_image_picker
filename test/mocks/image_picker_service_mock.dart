import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

class ImagePickerServiceMock extends Mock implements ImagePickerService {
  // @override
  // Future<Uint8List?> pickImage(ImageSource source) async {
  //   PictureRecorder recorder = PictureRecorder();
  //   Canvas c = Canvas(recorder);
  //   c.drawRect(
  //       const Rect.fromLTWH(0, 0, 100, 100), Paint()..color = Colors.red); // et
  //   Picture p = recorder.endRecording();
  //   var image = await p.toImage(100, 100);
  //   ByteData data =
  //       await image.toByteData(format: ImageByteFormat.png) as ByteData;
  //   return Future.value(data.buffer.asUint8List());
  // }
}
