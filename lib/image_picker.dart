import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

import 'src/models/image_picker_settings.dart';
import 'src/ui/image_picker_ui.dart';

class ImagePicker {
  Future<Uint8List?> showImagePickerDialog(BuildContext context,
      {String title = ImagePickerDefaultParameters.title,
      double titleTextSize = ImagePickerDefaultParameters.titleTextSize,
      double iconSize = ImagePickerDefaultParameters.iconSize,
      double iconTextSize = ImagePickerDefaultParameters.iconTextSize,
      double spaceBetweenIcons = ImagePickerDefaultParameters.spaceBetweenIcons,
      String makePhotoText = ImagePickerDefaultParameters.makePhotoText,
      IconData makePhotoIcon = ImagePickerDefaultParameters.makePhotoIcon,
      IconData selectImageIcon = ImagePickerDefaultParameters.selectImageIcon,
      String selectImageText = ImagePickerDefaultParameters.selectImageText,
      String closeButtonText = ImagePickerDefaultParameters.closeButtonText}) {
    return ImagePickerUI().pickImageDialog(
        context,
        title,
        titleTextSize,
        iconSize,
        iconTextSize,
        spaceBetweenIcons,
        makePhotoIcon,
        makePhotoText,
        selectImageIcon,
        selectImageText,
        closeButtonText);
  }
}
