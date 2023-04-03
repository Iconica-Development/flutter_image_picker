class ImagePickerConfig {
  /// The [ImagePickerConfig] is used to configure the [ImagePicker].
  const ImagePickerConfig({
    this.maxWidth,
    this.maxHeight,
    this.imageQuality,
    this.cameraOption,
  });

  /// If specified, the image will be at most `maxWidth` wide and
  /// `maxHeight` tall. Otherwise the image will be returned at it's
  /// original width and height.
  /// The `imageQuality` argument modifies the quality of the image, ranging from 0-100
  /// where 100 is the original/max quality. If `imageQuality` is null, the image with
  /// the original quality will be returned. Compression is only supported for certain
  /// image types such as JPEG and on Android PNG and WebP, too. If compression is not supported for the image that is picked,
  /// a warning message will be logged.
  final double? maxWidth;
  final double? maxHeight;
  final int? imageQuality;
  final bool? cameraOption;
}
