import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_picker/image_picker.dart';

void main() {
  runApp(const ImagePickerExample());
}

class ImagePickerExample extends StatelessWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

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
  const ImagePickerExampleHomePage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<ImagePickerExampleHomePage> createState() =>
      _ImagePickerExampleHomePageState();
}

class _ImagePickerExampleHomePageState
    extends State<ImagePickerExampleHomePage> {
  Uint8List? image;
  final ImagePicker imagePicker = ImagePicker();
  final double whiteSpace = 20;
  final double imageWidth = 300;
  final String placeholder = 'assets/images/placeholder.png';
  final String imageAlreadyDisplayedMessage =
      'Selected image is already being displayed!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: [
                if (image == null) ...[
                  Image.asset(
                    placeholder,
                    width: imageWidth,
                    height: imageWidth,
                  )
                ] else ...[
                  Image.memory(
                    image!,
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
                  onPressed: pickImage, child: const Text('Pick Image')),
              SizedBox(height: whiteSpace),
            ],
          ),
        ),
      ),
    );
  }

  /// The [pickImage] function is used to show the usage of the Image Picker Package.
  /// The most important part is the [showImagePickerDialog] function call.
  /// The only required parameter is the [context] of the application.
  /// There are multiple optional parameters that can be included to customize the Image Picker Dialog.
  /// You can add an optional parameter by for example adding [title: "Image Picker"] to the function call after the context parameter.
  /// Check the README for all possible optional parameters you can add.
  /// This function saves the image in a variable and if it's different than the current image it will get displayed in the application.
  /// When the same image is chosen there will be a snackbar popping up to let you know it's already being displayed.
  void pickImage() async {
    Uint8List? imageInBytes = await imagePicker.showImagePickerDialog(context);
    if (imageInBytes != null) {
      if (!listEquals(image, imageInBytes)) {
        setState(() {
          image = imageInBytes;
        });
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(imageAlreadyDisplayedMessage)),
        );
      }
    }
  }
}
