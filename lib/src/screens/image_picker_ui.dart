import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUI {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final double iconSize = 125;

  Future<Uint8List?> pickImageDialog(BuildContext context) async {
    return await showModalBottomSheet<Uint8List?>(
      context: context,
      builder: (BuildContext context) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.image),
                tooltip: 'Choose Image From Gallery',
                iconSize: iconSize,
                onPressed: () =>
                    _imagePickerService.pickImage(ImageSource.gallery, context),
              ),
              const Text("Select file"),
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.camera_alt_rounded),
                tooltip: 'Make Image With Camera',
                iconSize: iconSize,
                onPressed: () =>
                    _imagePickerService.pickImage(ImageSource.camera, context),
              ),
              const Text("Take a picture"),
            ],
          ),
          // ElevatedButton(
          //   onPressed: () =>
          //       _imagePickerService.pickImage(ImageSource.gallery, context),
          //   child: const Text('Gallery'),
          // ),
          // const SizedBox(width: 10),
          // ElevatedButton(
          //   onPressed: () =>
          //       _imagePickerService.pickImage(ImageSource.camera, context),
          //   child: const Text('Camera'),
          // ),
        ]);
      },
    );
  }
}
