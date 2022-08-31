import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

import 'src/screens/image_picker_ui.dart';
import 'src/models/image_picker_settings.dart';

class ImagePicker {
  Future<Uint8List?> showPickImageDialog(BuildContext context,
      {String title = ImagePickerDefaultParameters.title,
      double titleTextSize = ImagePickerDefaultParameters.titleTextSize,
      double iconSize = ImagePickerDefaultParameters.iconSize,
      double iconTextSize = ImagePickerDefaultParameters.iconTextSize,
      double spaceBetweenIcons = ImagePickerDefaultParameters.spaceBetweenIcons,
      String makePhotoText = ImagePickerDefaultParameters.makePhotoText,
      IconData makePhotoIcon = ImagePickerDefaultParameters.makePhotoIcon,
      String selectImageText = ImagePickerDefaultParameters.selectImageText,
      IconData selectImageIcon = ImagePickerDefaultParameters.selectImageIcon,
      String closeButtonText = ImagePickerDefaultParameters.closeButtonText}) {
    return ImagePickerUI().pickImageDialog(
        context,
        title,
        titleTextSize,
        iconSize,
        iconTextSize,
        spaceBetweenIcons,
        makePhotoText,
        makePhotoIcon,
        selectImageText,
        selectImageIcon,
        closeButtonText);
  }
}
