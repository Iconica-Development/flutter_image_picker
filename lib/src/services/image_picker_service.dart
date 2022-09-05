import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

/// The Image Picker Service class is the functionality of the Image Picker package which uses the Image Picker package to choose an image.
/// If you have your own implementation of the Image Picker you can add it to the constructor when creating the class.
class ImagePickerService {
  ImagePickerService({this.imagePicker});

  /// It's possible to have your own implementation for the Image Picker if you don't want to use the Image Picker Package.
  ImagePicker? imagePicker;

  /// [pickImage] is the function that picks the image and returns it as a [Uint8List].
  /// The function requires [source], an [ImageSource] that's the method of how the image needs to be picked, for example gallery or camera.
  Future<Uint8List?> pickImage(ImageSource source) async {
    var image =
        await (await (imagePicker ?? ImagePicker()).pickImage(source: source))
            ?.readAsBytes();
    return image;
  }
}
