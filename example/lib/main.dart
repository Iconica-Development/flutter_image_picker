// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_picker/flutter_image_picker.dart';

void main() {
  runApp(const ImagePickerExample());
}

class ImagePickerExample extends StatelessWidget {
  const ImagePickerExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImagePickerExampleHomePage(
          title: 'Flutter Image Picker Example'),
    );
  }
}

class ImagePickerExampleHomePage extends StatefulWidget {
  const ImagePickerExampleHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  ImagePickerExampleHomePageState createState() =>
      ImagePickerExampleHomePageState();
}

class ImagePickerExampleHomePageState
    extends State<ImagePickerExampleHomePage> {
  final double whiteSpace = 20;
  final double imageWidth = 300;
  final String placeholder = 'assets/images/placeholder.png';
  final String imageAlreadyDisplayedMessage =
      'The selected image is already being displayed!';

  Uint8List? uploadedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  uploadedImage = null;
                });
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: [
                if (uploadedImage == null) ...[
                  Image.asset(
                    placeholder,
                    width: imageWidth,
                    height: imageWidth,
                  )
                ] else ...[
                  Image.memory(
                    uploadedImage!,
                    width: imageWidth,
                    height: imageWidth,
                  )
                ]
              ]),
              SizedBox(height: whiteSpace),
              const Text(
                'Pick an image or make a photo!',
              ),
              SizedBox(height: whiteSpace / 2),
              ElevatedButton(
                  onPressed: pickImage,
                  key: const Key("PickImageButton"),
                  child: const Text('Pick Image')),
              SizedBox(height: whiteSpace),
            ],
          ),
        ),
      ),
    );
  }

  /// The [pickImage] function is used to show the usage of the Image Picker Package.
  /// The most important part is the [ImagePicker] call.
  /// You can add a custom [ImagePickerTheme] to the [ImagePicker] if you want to change some of the UI.
  /// An example on how to do that is: ImagePickerTheme(imagePickerTheme: const ImagePickerTheme(title: "Image Picker")).
  /// As a whole you get `ImagePicker(ImagePickerTheme(imagePickerTheme: const ImagePickerTheme(title: "Image Picker")))`
  /// Check the README for all possible parameters you can add in the [ImagePickerTheme].
  /// You can also add a custom Button as a Widget to the Image Picker Dialog.
  /// This function saves the image in a variable and if it's different than the current image it will get displayed in the application.
  /// When the same image is chosen there will be a snackbar popping up to let you know it's already being displayed.
  void pickImage() async {
    Uint8List? imageInBytes = await showModalBottomSheet<Uint8List?>(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext context) => ImagePicker(
              onError: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error.message ?? "An error occurred")),
                );
              },
            ));
    if (imageInBytes != null) {
      if (!listEquals(uploadedImage, imageInBytes)) {
        setState(() {
          uploadedImage = imageInBytes;
        });
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(imageAlreadyDisplayedMessage)),
        );
      }
    }
    imageInBytes = null;
  }
}
