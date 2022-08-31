import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

import 'src/screens/image_picker_ui.dart';
import 'src/models/image_picker_settings.dart';

class ImagePicker {
  Future<Uint8List?> showPickImageDialog(BuildContext context,
      {String title = ImagePickerSettings.title,
      String makePhotoText = ImagePickerSettings.makePhotoText,
      IconData makePhotoIcon = ImagePickerSettings.makePhotoIcon,
      String selectImageText = ImagePickerSettings.selectImageText,
      IconData selectImageIcon = ImagePickerSettings.selectImageIcon,
      String closeButtonText = ImagePickerSettings.closeButtonText}) {
    return ImagePickerUI().pickImageDialog(context, title, makePhotoText,
        makePhotoIcon, selectImageText, selectImageIcon, closeButtonText);
  }
}
