// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/flutter_image_picker.dart';
import 'package:image_picker/image_picker.dart';

/// The Image Picker class generates the Image Picker Widget which can be
/// displayed in your application. If you call the class you can give it 4
/// optional variables:
/// The first one is the [ImagePickerTheme] which can be used to change the UI
/// of the widget.
/// The second one is the [ImagePickerConfig] which can be used to configure the
/// behaviour of the image picker.
/// The third one is your own implementation of the ImagePickerService. Which
/// can be used in testing for example.
/// The fourth one is a custom Button widget.
class ImagePicker extends StatelessWidget {
  const ImagePicker({
    this.imagePickerTheme = const ImagePickerTheme(),
    this.imagePickerConfig = const ImagePickerConfig(),
    this.imagePickerService,
    this.customButton,
    super.key,
  });

  /// ImagePickerTheme can be used to change the UI of the Image Picker Widget to change the text/icons to your liking.
  final ImagePickerTheme imagePickerTheme;

  /// ImagePickerConfig can be used to define the size and quality for the
  /// uploaded image.
  final ImagePickerConfig imagePickerConfig;

  /// The Image Picker Dialog can have a custom button if you want to.
  final Widget? customButton;

  /// The ImagePickerService can be used if you want to use your own
  /// implementation of the Image Service if you want to use it for testing or
  /// add more features. If null the current implementation will be used.
  final ImagePickerService? imagePickerService;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              tileColor: imagePickerTheme.titleBackgroundColor,
              title: Text(
                textAlign: imagePickerTheme.titleAlignment,
                imagePickerTheme.title,
                style: TextStyle(
                  fontFamily: imagePickerTheme.font,
                  fontSize: imagePickerTheme.titleTextSize,
                  color: imagePickerTheme.titleColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _generateIconButtonWithText(
                  context,
                  imagePickerTheme.selectImageIcon,
                  imagePickerTheme,
                  Icons.image,
                  ImageSource.gallery,
                  imagePickerTheme.selectImageText,
                ),
                if (imagePickerConfig.cameraOption ?? true) ...[
                  SizedBox(
                    width: imagePickerTheme.spaceBetweenIcons,
                  ),
                  _generateIconButtonWithText(
                    context,
                    imagePickerTheme.makePhotoIcon,
                    imagePickerTheme,
                    Icons.camera_alt_rounded,
                    ImageSource.camera,
                    imagePickerTheme.makePhotoText,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: imagePickerTheme.closeButtonWidth,
                  height: imagePickerTheme.closeButtonHeight,
                  child: customButton ??
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              imagePickerTheme.closeButtonBackgroundColor,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          imagePickerTheme.closeButtonText,
                          style: TextStyle(
                            fontFamily: imagePickerTheme.font,
                            fontSize: imagePickerTheme.closeButtonTextSize,
                            color: imagePickerTheme.closeButtonTextColor,
                          ),
                        ),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );

  /// The [_generateIconButtonWithText] function returns a column that includes 
  /// an [IconButton] and [Text].
  /// The function requires the following parameters to be able to generate an 
  /// icon with text:
  /// [context] The build context that is required to make the [pickImage] 
  /// function in [_imagePickerService] work.
  /// [imagePickerTheme] The ImagePickerTheme that includes all default values 
  /// for the Image Picker Dialog.
  /// [icon] The icon that needs to be displayed, requires an [IconData] as 
  ///value to be used.
  /// [imageSource] The type of [ImageSource] to be used to pick an image when 
  /// pressed on the icon.
  /// [bottomText] The text that's displayed underneath the icon.
  Column _generateIconButtonWithText(
    BuildContext context,
    Widget? customIcon,
    ImagePickerTheme imagePickerTheme,
    IconData icon,
    ImageSource imageSource,
    String bottomText,
  ) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            key: Key(bottomText),
            onTap: () async {
              var navigator = Navigator.of(context);
              var image =
                  await (imagePickerService ?? ImagePickerServiceDefault())
                      .pickImage(imageSource, config: imagePickerConfig);
              navigator.pop(image);
            },
            child: customIcon ??
                Icon(
                  icon,
                  size: imagePickerTheme.iconSize,
                  color: imagePickerTheme.iconColor,
                ),
          ),
          Text(
            bottomText,
            style: TextStyle(
              fontFamily: imagePickerTheme.font,
              fontSize: imagePickerTheme.iconTextSize,
              color: imagePickerTheme.textColor,
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
}
