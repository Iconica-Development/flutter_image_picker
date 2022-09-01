import 'package:flutter/material.dart';

class ImagePickerTheme {
  /// The [ImagePickerTheme] is used to style the [ImagePicker].

  const ImagePickerTheme(
      {this.title = "Upload Image",
      this.titleTextSize = 20,
      this.iconSize = 125,
      this.iconTextSize = 15,
      this.spaceBetweenIcons = 30,
      this.makePhotoIcon = Icons.camera_alt_rounded,
      this.makePhotoText = "Take a Picture",
      this.selectImageIcon = Icons.image,
      this.selectImageText = "Select File",
      this.closeButtonText = "Close"});

  final String title;
  final double titleTextSize;
  final double iconSize;
  final double iconTextSize;
  final double spaceBetweenIcons;
  final IconData makePhotoIcon;
  final String makePhotoText;
  final IconData selectImageIcon;
  final String selectImageText;
  final String closeButtonText;
}
