import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUI {
  final ImagePickerService _imagePickerService = ImagePickerService();

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
                generateIconButtonWithText(context, selectImageIcon, iconSize,
                    iconTextSize, ImageSource.gallery, selectImageText),
                SizedBox(
                  width: spaceBetweenIcons,
                ),
                generateIconButtonWithText(context, makePhotoIcon, iconSize,
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

  Column generateIconButtonWithText(
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
