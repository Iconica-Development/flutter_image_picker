import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUI {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final double iconSize = 150;

  Future<Uint8List?> pickImageDialog(BuildContext context) async {
    return await showModalBottomSheet<Uint8List?>(
      context: context,
      builder: (BuildContext context) {
        return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Upload Image",
            textScaleFactor: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              generateColumn(
                  context, Icons.image, ImageSource.gallery, "Select File"),
              generateColumn(context, Icons.camera_alt_rounded,
                  ImageSource.camera, "Take a picture"),
            ],
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close")),
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
