import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

import '../models/image_picker_theme.dart';

/// The Image Picker class generates the Image Picker Widget which can be displayed in your application. If you call the class you can give it 2 optional variables:
/// The first one is the [ImagePickerTheme] which can be used to change the UI of the widget.
/// The second one is your own implementation of the ImagePickerService. Which can be used in testing for example.
class ImagePicker extends StatelessWidget {
  const ImagePicker(
      {Key? key,
      this.imagePickerTheme = const ImagePickerTheme(),
      this.imagePickerService})
      : super(key: key);

  /// ImagePickerTheme can be used to change the UI of the Image Picker Widget to change the text/icons to your liking.
  final ImagePickerTheme imagePickerTheme;

  /// The ImagePickerService can be used if you want to use your own implementation of the Image Service if you want to use it for testing or add more features. If null the current implementation will be used.
  final ImagePickerService? imagePickerService;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Wrap(
      children: <Widget>[
        ListTile(
          title: Text(
            imagePickerTheme.title,
            style: TextStyle(
              fontSize: imagePickerTheme.titleTextSize,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _generateIconButtonWithText(
                context,
                imagePickerTheme,
                imagePickerTheme.selectImageIcon,
                ImageSource.gallery,
                imagePickerTheme.selectImageText),
            SizedBox(
              width: imagePickerTheme.spaceBetweenIcons,
            ),
            _generateIconButtonWithText(
                context,
                imagePickerTheme,
                imagePickerTheme.makePhotoIcon,
                ImageSource.camera,
                imagePickerTheme.makePhotoText),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: imagePickerTheme.closeButtonWidth,
              height: imagePickerTheme.closeButtonHeight,
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(imagePickerTheme.closeButtonText)),
            )
          ],
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    ));
  }

  /// The [_generateIconButtonWithText] function returns a column that includes an [IconButton] and [Text].
  /// The function requires the following parameters to be able to generate an icon with text:
  /// [context] The build context that is required to make the [pickImage] function in [_imagePickerService] work.
  /// [imagePickerTheme] The ImagePickerTheme that includes all default values for the Image Picker Dialog.
  /// [icon] The icon that needs to be displayed, requires an [IconData] as value to be used.
  /// [imageSource] The type of [ImageSource] to be used to pick an image when pressed on the icon.
  /// [bottomText] The text that's displayed underneath the icon.
  Column _generateIconButtonWithText(
      BuildContext context,
      ImagePickerTheme imagePickerTheme,
      IconData icon,
      ImageSource imageSource,
      String bottomText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          key: Key(bottomText),
          icon: Icon(icon),
          iconSize: imagePickerTheme.iconSize,
          onPressed: () async {
            final navigator = Navigator.of(context);
            var image = await (imagePickerService ?? ImagePickerService())
                .pickImage(imageSource);
            navigator.pop(image);
          },
        ),
        Text(
          bottomText,
          style: TextStyle(fontSize: imagePickerTheme.iconTextSize),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
