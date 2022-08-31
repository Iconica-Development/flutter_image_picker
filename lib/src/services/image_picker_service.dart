import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _imagePicker = ImagePicker();

  void pickImage(ImageSource source, BuildContext context) async {
    var image =
        await (await _imagePicker.pickImage(source: source))?.readAsBytes();
    Navigator.of(context).pop(image);
  }
}
