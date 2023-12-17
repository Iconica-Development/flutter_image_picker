[![pub package](https://img.shields.io/pub/v/flutter_introduction_widget.svg)](https://github.com/Iconica-Development) [![Build status](https://img.shields.io/github/workflow/status/Iconica-Development/flutter_introduction_widget/CI)](https://github.com/Iconica-Development/flutter_image_picker/actions/new) [![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)

# Flutter Image Picker

Image Picker that can be used to pick an image from storage or make a picture with your camera. This package is built with Flutter and is customizable with icons, descriptions and sizes.

![Image Picker GIF](flutter_image_picker.gif)

Figma Design that defines this component (only accessible for Iconica developers): https://www.figma.com/file/4WkjwynOz5wFeFBRqTHPeP/Iconica-Design-System?type=design&node-id=357%3A3354&mode=design&t=XulkAJNPQ32ARxWh-1
Figma clickable prototype that demonstrates this component (only accessible for Iconica developers): https://www.figma.com/proto/4WkjwynOz5wFeFBRqTHPeP/Iconica-Design-System?type=design&node-id=340-611&viewport=188%2C-512%2C0.05&t=XulkAJNPQ32ARxWh-0&scaling=min-zoom&starting-point-node-id=516%3A2544&show-proto-sidebar=1

## Setup

To use this package, add `flutter_image_picker` as a dependency in your pubspec.yaml file.

## How to use

See the [Example Code](example/lib/main.dart) for an example on how to use this package.

You can add an optional `ImagePickerTheme()` to the `ImagePicker()` to change the layout of the Image Picker Dialog. You can add the following parameters to the `ImagePickerTheme`:
An example on how to add a parameter to the `ImagePickerTheme()` is: `ImagePickerTheme(imagePickerTheme: const ImagePickerTheme(title: "Image Picker"))`.
As a whole you get `ImagePicker(ImagePickerTheme(imagePickerTheme: const ImagePickerTheme(title: "Image Picker")))`

| Parameter                  | Explaination                                                                                                         |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| font                       | The font that is being used in the Image Picker Dialog.                                                              |
| title                      | The title displayed at the top of the Image Picker Dialog.                                                           |
| titleTextSize              | The font size of the title mentioned above.                                                                          |
| titleColor                 | The color of the title text.                                                                                         |
| titleBackgroundColor       | The color of the title background.                                                                                   |
| titleAlignment             | The alignment of the title text.                                                                                     |
| textColor                  | The color of the text that is displayed in the Image Picker Dialog.                                                  |
| iconColor                  | The color of the icons that are displayed in the Image Picker Dialog.                                                |
| iconSize                   | The size of the icons that are visible in the Image Picker Dialog.                                                   |
| iconTextSize               | The font size of the text underneath the icon buttons.                                                               |
| spaceBetweenIcons          | The size of the space between the two icons in the Image Picker Dialog.                                              |
| makePhotoIcon              | The widget that is displayed for the 'Make Photo' functionality of the Image Picker Dialog.                          |
| makePhotoText              | The text that is displayed underneath the 'Make Photo' icon.                                                         |
| selectImageIcon            | The widget that is displayed for the 'Select Image From Gallery' functionality of the Image Picker Dialog.           |
| selectImageText            | The text that is displayed underneath the 'Select Image From Gallery' icon.                                          |
| closeButtonText            | The text that is shown on the 'Close Dialog' button at the bottom of the Image Picker Dialog.                        |
| closeButtonTextSize        | The size of the text that is being displayed on the 'Close Dialog' button at the bottom of the Image Picker Dialog.  |
| closeButtonTextColor       | The color of the text that is being displayed on the 'Close Dialog' button at the bottom of the Image Picker Dialog. |
| closeButtonWidth           | The width of the 'Close Dialog' button at the bottom of the Image Picker Dialog.                                     |
| closeButtonHeight          | The height of the 'Close Dialog' button at the bottom of the Image Picker Dialog.                                    |
| closeButtonBackgroundColor | The background color of the 'Close Dialog' button at the bottom of the Image Picker Dialog.                          |

## Issues

Please file any issues, bugs or feature request as an issue on our [GitHub](https://github.com/Iconica-Development/flutter_image_picker) page. Commercial support is available if you need help with integration with your app or services. You can contact us at [support@iconica.nl](mailto:support@iconica.nl).

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](./CONTRIBUTING.md) and send us your [pull request](https://github.com/Iconica-Development/flutter_image_picker/pulls).

## Author

This `flutter_image_picker` for Flutter is developed by [Iconica](https://iconica.nl). You can contact us at <support@iconica.nl>
