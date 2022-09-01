import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

import 'src/models/image_picker_settings.dart';
import 'src/ui/image_picker_ui.dart';

class ImagePicker {
  /// [showImagePickerDialog] is the function that gets called by the user of the package.
  /// With this function the Image Picker Dialog gets shown and can be used to pick an image.
  /// The image gets returned as a [Uint8List] and can be used in the application.
  /// It can also return null when there is no image selected.
  /// The function has one required parameter and multiple optional parameters to customize the Image Picker Dialog.
  /// The only required parameter is [context] which is the [BuildContext] of the application.
  /// Then you can give the following optional parameters to customize the Image Picker Dialog:
  /// [title] expects a [String] that is used as the title of the Image Picker Dialog and will be showed at the top of it.
  /// [titleTextSize] is the font size of the [title].
  /// [iconSize] is the size of each icon shown in the Image Picker Dialog.
  /// [iconTextSize] is the size of the text that's show underneath the icon.
  /// [spaceBetweenIcons] is the size of the space that's between the two icons in the Image Picker Dialog.
  /// [makePhotoIcon] is the icon as [IconData] that's shown for the make photo button of the Image Picker Dialog.
  /// [makePhotoText] is the text that's shown underneath the make photo button in the Image Picker Dialog.
  /// [selectImageIcon] is the icon as [IconData] that's shown for the select image button of the Image Picker Dialog.
  /// [selectImageText] is the text that's shown underneath the select image button in the Image Picker Dialog.
  /// [closeButtonText] is the text that's shown on the close dialog button on the bottom of the Image Picker Dialog.
  Future<Uint8List?> showImagePickerDialog(BuildContext context,
      {String title = ImagePickerDefaultParameters.title,
      double titleTextSize = ImagePickerDefaultParameters.titleTextSize,
      double iconSize = ImagePickerDefaultParameters.iconSize,
      double iconTextSize = ImagePickerDefaultParameters.iconTextSize,
      double spaceBetweenIcons = ImagePickerDefaultParameters.spaceBetweenIcons,
      IconData makePhotoIcon = ImagePickerDefaultParameters.makePhotoIcon,
      String makePhotoText = ImagePickerDefaultParameters.makePhotoText,
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
