// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import "package:flutter_image_picker/src/models/image_picker_config.dart";
import "package:image_picker/image_picker.dart" as image_picker;

/// An abstract service that defines the contract for picking images.
///
/// This allows for interchangeable implementations, such as a default one
/// using the `image_picker` package or a mock service for testing.
mixin ImageFilePickerService {
  /// Picks a single image from the specified [source].
  ///
  /// Returns a [Future] that completes with an [XFile] object of the picked
  /// image, or `null` if the user cancels the operation.
  ///
  /// The optional [config] can be used to specify constraints like
  /// max width, max height, and image quality.
  Future<image_picker.XFile?> pickImage(
    image_picker.ImageSource source, {
    ImagePickerConfig? config,
  });

  /// Picks multiple images from the gallery.
  ///
  /// Returns a [Future] that completes with a list of [XFile] objects for the
  /// picked images, or `null` if the user cancels the operation.
  ///
  /// The optional [config] can be used to specify constraints like
  /// max width, max height, and image quality.
  Future<List<image_picker.XFile>?> pickMultiImage({
    ImagePickerConfig? config,
  });
}

/// The default implementation of [ImageFilePickerService] that uses the
/// `image_picker` package to handle image selection.
class ImageFilePickerServiceDefault implements ImageFilePickerService {
  /// Creates an instance of the default image picker service.
  ///
  /// An optional [imagePicker] instance can be provided, which is useful
  /// for testing or if a custom-configured `ImagePicker` is needed.
  /// If not provided, a new instance of `image_picker.ImagePicker` is created.
  ImageFilePickerServiceDefault({this.imagePicker});

  /// An optional instance of the `ImagePicker` from the `image_picker` package.
  ///
  /// Used to override the default `ImagePicker` instance, primarily for
  /// testing.
  final image_picker.ImagePicker? imagePicker;

  @override
  Future<image_picker.XFile?> pickImage(
    image_picker.ImageSource source, {
    ImagePickerConfig? config,
  }) async =>
      (imagePicker ?? image_picker.ImagePicker()).pickImage(
        source: source,
        maxWidth: config?.maxWidth,
        maxHeight: config?.maxHeight,
        imageQuality: config?.imageQuality,
      );

  @override
  Future<List<image_picker.XFile>?> pickMultiImage({
    ImagePickerConfig? config,
  }) async =>
      (imagePicker ?? image_picker.ImagePicker()).pickMultiImage(
        maxWidth: config?.maxWidth,
        maxHeight: config?.maxHeight,
        imageQuality: config?.imageQuality,
      );
}
