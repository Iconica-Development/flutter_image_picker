// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'dart:typed_data';
import 'package:flutter_image_picker/src/models/image_picker_config.dart';
import 'package:image_picker/image_picker.dart';

/// The Image Picker Service class is the functionality of the Image Picker
/// package which uses the Image Picker package to choose an image.
/// If you have your own implementation of the Image Picker you can add it to
/// the constructor when creating the class.
mixin ImagePickerService {
  /// [pickImage] is the function that picks the image and returns it as a
  /// [Uint8List].
  /// The function requires [source], an [ImageSource]
  Future<Uint8List?> pickImage(
    ImageSource source, {
    ImagePickerConfig? config,
  });
}

/// The ImagePickerServiceDefault is the default implementation of the
/// ImagePickerService.
/// It uses the Image Picker package to pick an image and returns it as a
/// [Uint8List].
class ImagePickerServiceDefault implements ImagePickerService {
  ImagePickerServiceDefault({this.imagePicker});

  /// It's possible to have your own implementation for the Image Picker if you
  /// don't want to use the Image Picker Package.
  ImagePicker? imagePicker;

  /// [pickImage] is the function that picks the image and returns it as a
  /// [Uint8List].
  /// The function requires [source], an [ImageSource] that's the method of how
  /// the image needs to be picked, for example gallery or camera.
  @override
  Future<Uint8List?> pickImage(
    ImageSource source, {
    ImagePickerConfig? config,
  }) async =>
      await (await (imagePicker ?? ImagePicker()).pickImage(
        source: source,
        maxWidth: config?.maxWidth,
        maxHeight: config?.maxHeight,
        imageQuality: config?.imageQuality,
      ))
          ?.readAsBytes();
}
