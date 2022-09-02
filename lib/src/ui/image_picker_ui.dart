import 'package:flutter/material.dart';
import 'package:flutter_image_picker/src/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

import '../models/image_picker_theme.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker(
      {Key? key,
      this.imagePickerTheme = const ImagePickerTheme(),
      this.imagePickerService})
      : super(key: key);

  final ImagePickerTheme imagePickerTheme;
  final ImagePickerService? imagePickerService;

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
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
            var image = await (imagePickerService ?? ImagePickerService())
                .pickImage(imageSource);
            Navigator.of(context).pop(image);
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
