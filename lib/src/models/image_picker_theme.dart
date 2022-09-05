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
      this.closeButtonText = "Close",
      this.closeButtonWidth = 300,
      this.closeButtonHeight = 40});

  /// The title displayed at the top of the Image Picker Dialog.
  final String title;

  /// The font size of the title mentioned above.
  final double titleTextSize;

  /// The size of the icons that are visible in the Image Picker Dialog.
  final double iconSize;

  /// The font size of the text underneath the icon buttons.
  final double iconTextSize;

  /// The size of the space between the two icons in the Image Picker Dialog.
  final double spaceBetweenIcons;

  /// The icon that is displayed for the 'Make Photo' functionality of the Image Picker Dialog.
  final IconData makePhotoIcon;

  /// The text that is displayed underneath the 'Make Photo' icon.
  final String makePhotoText;

  /// The icon that is displayed for the 'Select Image From Gallery' functionality of the Image Picker Dialog.
  final IconData selectImageIcon;

  /// The text that is displayed underneath the 'Select Image From Gallery' icon.
  final String selectImageText;

  /// The text that is shown on the 'Close Dialog' button at the bottom of the Image Picker Dialog.
  final String closeButtonText;

  /// The width of the 'Close Dialog' button at the bottom of the Image Picker Dialog.
  final double closeButtonWidth;

  /// The height of the 'Close Dialog' button at the bottom of the Image Picker Dialog.
  final double closeButtonHeight;
}
