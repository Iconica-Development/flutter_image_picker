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
      title: 'Flutter Demo',
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
  ImagePicker imagePicker = ImagePicker();

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
                  Image.asset('assets/images/placeholder.png')
                ] else ...[
                  Image.memory(image!)
                ]
              ]),
              const SizedBox(height: 20),
              const Text(
                'Pick or make an Image/Photo!',
              ),
              ElevatedButton(
                  onPressed: pickImage, child: const Text('Pick Image'))
            ],
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    Uint8List? imageInBytes = await imagePicker.showPickImageDialog(context);
    if (imageInBytes != null && !listEquals(image, imageInBytes)) {
      setState(() {
        image = imageInBytes;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Selected image is already being displayed!')),
      );
    }
  }
}
