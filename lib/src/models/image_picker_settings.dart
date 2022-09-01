import 'package:flutter/material.dart';

/// Default values for all the possible optional parameters to be included in the function call when opening the Image Picker Dialog.
/// When the function call has no optional parameters included these values will be used.
class ImagePickerDefaultParameters {
  static const String title = "Upload Image";
  static const double titleTextSize = 20;
  static const double iconSize = 125;
  static const double iconTextSize = 15;
  static const double spaceBetweenIcons = 30;
  static const IconData makePhotoIcon = Icons.camera_alt_rounded;
  static const String makePhotoText = "Take a Picture";
  static const IconData selectImageIcon = Icons.image;
  static const String selectImageText = "Select File";
  static const String closeButtonText = "Close";
}
