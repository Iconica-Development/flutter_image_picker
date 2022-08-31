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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.image),
                    tooltip: 'Choose Image From Gallery',
                    iconSize: iconSize,
                    onPressed: () => _imagePickerService.pickImage(
                        ImageSource.gallery, context),
                  ),
                  const Text("Select file"),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.camera_alt_rounded),
                    tooltip: 'Make Image With Camera',
                    iconSize: iconSize,
                    onPressed: () => _imagePickerService.pickImage(
                        ImageSource.camera, context),
                  ),
                  const Text("Take a picture"),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close")),
        ]);
      },
    );
  }
}
