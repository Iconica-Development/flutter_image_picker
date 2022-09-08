import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_picker/flutter_image_picker.dart';
import 'package:flutter_image_picker_example/button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider =
    StateNotifierProvider.autoDispose<ImageNotifier, Uint8List?>((ref) {
  return ImageNotifier();
});

class ImageNotifier extends StateNotifier<Uint8List?> {
  ImageNotifier() : super(null);

  Uint8List? image;

  void changeImage(Uint8List newImage) {
    state = image = newImage;
  }

  void cleanImage() {
    state = image = null;
  }
}

void main() {
  runApp(const ProviderScope(child: ImagePickerExample()));
}

class ImagePickerExample extends ConsumerWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

class ImagePickerExampleHomePage extends ConsumerStatefulWidget {
  const ImagePickerExampleHomePage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  ImagePickerExampleHomePageState createState() =>
      ImagePickerExampleHomePageState();
}

class ImagePickerExampleHomePageState
    extends ConsumerState<ImagePickerExampleHomePage> {
  final double whiteSpace = 20;
  final double imageWidth = 300;
  final String placeholder = 'assets/images/placeholder.png';
  final String imageAlreadyDisplayedMessage =
      'The selected image is already being displayed!';

  @override
  Widget build(BuildContext context) {
    final imageWatcher = ref.watch(imageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(imageProvider);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ProviderScope(
                  child: Column(children: [
                if (imageWatcher == null) ...[
                  Image.asset(
                    placeholder,
                    width: imageWidth,
                    height: imageWidth,
                  )
                ] else ...[
                  Image.memory(
                    imageWatcher,
                    width: imageWidth,
                    height: imageWidth,
                  )
                ]
              ])),
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
        builder: (BuildContext context) => const ImagePicker());
    if (imageInBytes != null) {
      if (!listEquals(ref.read(imageProvider), imageInBytes)) {
        ref.read(imageProvider.notifier).changeImage(imageInBytes);
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
