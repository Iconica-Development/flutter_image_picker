// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

class ImagePickerTheme {
  /// The [ImagePickerTheme] is used to style the [ImagePicker].

  const ImagePickerTheme({
    this.font = "Roboto",
    this.title = "Upload Image",
    this.titleTextSize = 20,
    this.titleColor = Colors.black,
    this.titleBackgroundColor = Colors.white,
    this.titleAlignment = TextAlign.left,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.iconSize = 125,
    this.iconTextSize = 15,
    this.spaceBetweenIcons = 30,
    this.makePhotoIcon,
    this.makePhotoText = "Take a Picture",
    this.selectImageIcon,
    this.selectImageText = "Select File",
    this.closeButtonText = "Close",
    this.closeButtonTextSize = 15,
    this.closeButtonTextColor = Colors.white,
    this.closeButtonWidth = 300,
    this.closeButtonHeight = 40,
    this.closeButtonBackgroundColor = Colors.black,
  });

  /// The font that's used in the Image Picker
  final String font;

  /// The title displayed at the top of the Image Picker Dialog.
  final String title;

  /// The font size of the title mentioned above.
  final double titleTextSize;

  /// The color of the title text.
  final Color titleColor;

  /// The color of the title background.
  final Color titleBackgroundColor;

  /// The alignment of the title text.
  final TextAlign titleAlignment;

  /// The color of the icons
  final Color iconColor;

  /// The color of the text in the Image Picker Dialog
  final Color textColor;

  /// The size of the icons that are visible in the Image Picker Dialog.
  final double iconSize;

  /// The font size of the text underneath the icon buttons.
  final double iconTextSize;

  /// The size of the space between the two icons in the Image Picker Dialog.
  final double spaceBetweenIcons;

  /// The icon that is displayed for the 'Make Photo' functionality of the Image Picker Dialog.
  final Widget? makePhotoIcon;

  /// The text that is displayed underneath the 'Make Photo' icon.
  final String makePhotoText;

  /// The icon that is displayed for the 'Select Image From Gallery' functionality of the Image Picker Dialog.
  final Widget? selectImageIcon;

  /// The text that is displayed underneath the 'Select Image From Gallery' icon.
  final String selectImageText;

  /// The text that is shown on the 'Close Dialog' button at the bottom of the Image Picker Dialog.
  final String closeButtonText;

  /// The fontsize of the text of the close button of the Image Picker Dialog.
  final double closeButtonTextSize;

  /// The color of the text of the close button of the Image Picker Dialog.
  final Color closeButtonTextColor;

  /// The width of the 'Close Dialog' button at the bottom of the Image Picker Dialog.
  final double closeButtonWidth;

  /// The height of the 'Close Dialog' button at the bottom of the Image Picker Dialog.
  final double closeButtonHeight;

  /// The color of the close button of the Image Picker Dialog.
  final Color closeButtonBackgroundColor;
}
