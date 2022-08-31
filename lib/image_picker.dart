import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

import 'src/screens/image_picker_ui.dart';

class ImagePicker {
  Future<Uint8List?> showPickImageDialog(BuildContext context) {
    return ImagePickerUI().pickImageDialog(context);
  }
}
