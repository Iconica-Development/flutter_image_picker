# Flutter Image Picker
Flutter Image Picker is a package you can use to implement an Image Picker in your Flutter app.

![Gif](example/gif/ImagePickerGif.gif)

## Features

With the Flutter Image Picker you can select an existing picture from the gallery or make a picture with the camera to use in your app. 

## Usage

To use this package, add `flutter_image_picker` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

## Example

See the [Example Code](example/lib/main.dart) for an example on how to use this package.

You can add optional parameters to the `showImagePickerDialog(context)` function call. These are:
|     Parameter     |  Explaination  |
|-------------------|----------------|
|       title       | The title displayed at the top of the Image Picker Dialog. |
|   titleTextSize   | The font size of the title mentioned above. |
|     iconSize      | The size of the icons that are visible in the Image Picker Dialog. |
|   iconTextSize    | The font size of the text underneath the icon buttons. |
| spaceBetweenIcons | The size of the space between the two icons in the Image Picker Dialog. |
|   makePhotoIcon   | The icon that is displayed for the 'Make Photo' functionality of the Image Picker Dialog. |
|   makePhotoText   | The text that is displayed underneath the 'Make Photo' icon. |
|  selectImageIcon  | The icon that is displayed for the 'Select Image From Gallery' functionality of the Image Picker Dialog. |
|  selectImageText  | The text that is displayed underneath the 'Select Image From Gallery' icon. |
|  closeButtonText  | The text that is shown on the 'Close Dialog' button at the bottom of the Image Picker Dialog. |
|  closeButtonWidth  | The width of the 'Close Dialog' button at the bottom of the Image Picker Dialog. |
|  closeButtonHeight  | The height of the 'Close Dialog' button at the bottom of the Image Picker Dialog. |


The `showImagePickerDialog(context)` function returns an `Uint8List` as value which you can use in your application.

## Issues & Feedback

Please file an [issue](https://github.com/Iconica-Development/flutter_image_picker/issues) to send feedback or report a bug.
Thank you!

## Contributing

Every pull request is welcome.