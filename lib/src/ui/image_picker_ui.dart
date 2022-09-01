import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUI {
  final ImagePickerService _imagePickerService = ImagePickerService();

  /// [pickImageDialog] returns a [ModalBottomSheet] widget that displays two icons.
  /// When clicked on the left icon the user can pick an image from their documents on their phone.
  /// When clicked on the right icon the user can make a photo with the camera on their phone.
  /// The function gets all the parameters from the [image_picker] class where a function provides them all.
  /// See that function for a description of each parameter.
  /// The [pickImageDialog] function can return a [Uint8List] that is the picked image as a bytes list.
  /// It can also return null when no image gets chosen.
  Future<Uint8List?> pickImageDialog(
      BuildContext context,
      String title,
      double titleTextSize,
      double iconSize,
      double iconTextSize,
      double spaceBetweenIcons,
      IconData makePhotoIcon,
      String makePhotoText,
      IconData selectImageIcon,
      String selectImageText,
      String closeButtonText) async {
    return await showModalBottomSheet<Uint8List?>(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontSize: titleTextSize,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _generateIconButtonWithText(context, selectImageIcon, iconSize,
                    iconTextSize, ImageSource.gallery, selectImageText),
                SizedBox(
                  width: spaceBetweenIcons,
                ),
                _generateIconButtonWithText(context, makePhotoIcon, iconSize,
                    iconTextSize, ImageSource.camera, makePhotoText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(closeButtonText)),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        );
      },
    );
  }

  /// The [_generateIconButtonWithText] function returns a column that includes an [IconButton] and [Text].
  /// The function requires the following parameters to be able to generate an icon with text:
  /// [context] The build context that is required to make the [pickImage] function in [_imagePickerService] work.
  /// [icon] The icon that needs to be displayed, requires an [IconData] as value to be used.
  /// [iconSize] The size of the icon.
  /// [iconTextSize] The size of the text that's displayed underneath the icon.
  /// [imageSource] The type of [ImageSource] to be used to pick an image when pressed on the icon.
  /// [bottomText] The text that's displayed underneath the icon.
  Column _generateIconButtonWithText(
      BuildContext context,
      IconData icon,
      double iconSize,
      double iconTextSize,
      ImageSource imageSource,
      String bottomText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          iconSize: iconSize,
          onPressed: () => _imagePickerService.pickImage(imageSource, context),
        ),
        Text(
          bottomText,
          style: TextStyle(fontSize: iconTextSize),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
