import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _imagePicker = ImagePicker();

  /// [pickImage] is the function that picks the image and returns it when the Image Picker Dialog gets closed.
  /// The function requires [source], an [ImageSource] that's the method of how the image needs to be picked, for example gallery or camera.
  /// It also requires [context], the [BuildContext] which is needed to be able to return the image when the Image Picker Dialog gets closed.
  void pickImage(ImageSource source, BuildContext context) async {
    var image =
        await (await _imagePicker.pickImage(source: source))?.readAsBytes();
    Navigator.of(context).pop(image);
  }
}
