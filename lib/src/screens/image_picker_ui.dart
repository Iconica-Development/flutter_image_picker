import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUI {
  final ImagePicker _imagePicker = ImagePicker();

  Future<Uint8List?> pickImageDialog(BuildContext context) async {
    return await showDialog<Uint8List?>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Image Picker'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Do you want to choose an existing image or make a new picture with the camera?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery, context),
              child: const Text('Pick image from Gallery'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera, context),
              child: const Text('Make picture with Camera'),
            ),
            TextButton(
              child: const Text('Close Dialog'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _pickImage(ImageSource source, BuildContext context) async {
    var image =
        await (await _imagePicker.pickImage(source: source))?.readAsBytes();
    Navigator.of(context).pop(image);
  }
}
