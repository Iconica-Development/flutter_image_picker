import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService({this.imagePicker});

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
