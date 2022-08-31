import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUI {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final double iconSize = 150;

  Future<Uint8List?> pickImageDialog(
      BuildContext context,
      String title,
      String makePhotoText,
      IconData makePhotoIcon,
      String selectImageText,
      IconData selectImageIcon,
      String closeButtonText) async {
    return await showModalBottomSheet<Uint8List?>(
      context: context,
      builder: (BuildContext context) {
        return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textScaleFactor: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              generateColumn(context, selectImageIcon, ImageSource.gallery,
                  selectImageText),
              generateColumn(
                  context, makePhotoIcon, ImageSource.camera, makePhotoText),
            ],
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(closeButtonText)),
        ]);
      },
    );
  }

  Column generateColumn(BuildContext context, IconData icon,
      ImageSource imageSource, String bottomText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          iconSize: iconSize,
          onPressed: () => _imagePickerService.pickImage(imageSource, context),
        ),
        Text(bottomText),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
