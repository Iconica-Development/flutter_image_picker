// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

class ImagePickerTheme {
  /// The [ImagePickerTheme] is used to style the [ImagePicker].

  const ImagePickerTheme({
    this.iconColor = Colors.black,
    this.iconSize = 125,
    this.spaceBetweenIcons = 30,
    this.makePhotoIcon,
    this.makePhotoText = 'Take a Picture',
    this.selectImageIcon,
    this.selectImageText = 'Select File',
    this.iconTextStyle,
    this.closeButtonBuilder,
  });

  /// The color of the icons
  final Color iconColor;

  /// The size of the icons that are visible in the Image Picker Dialog.
  final double iconSize;

  /// The size of the space between the two icons in the Image Picker Dialog.
  final double spaceBetweenIcons;

  /// The icon that is displayed for the 'Make Photo' functionality of the
  /// Image Picker Dialog.
  final Widget? makePhotoIcon;

  /// The text that is displayed underneath the 'Make Photo' icon.
  final String makePhotoText;

  /// The icon that is displayed for the 'Select Image From Gallery'
  /// functionality of the Image Picker Dialog.
  final Widget? selectImageIcon;

  /// The text that is displayed underneath the 'Select Image From Gallery'
  /// icon.
  final String selectImageText;

  final TextStyle? iconTextStyle;

  final Widget Function(Function onTap)? closeButtonBuilder;
}
