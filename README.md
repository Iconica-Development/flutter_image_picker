<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Flutter Image Picker
Flutter Image Picker is a package you can use to implement an Image Picker in your Flutter app.

## Features

With the Flutter Image Picker you can select an existing picture from the gallery or make a picture with the camera to use in your app. 

## Usage

To use this package, add `flutter_image_picker` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

## Example

See [Example Code](example/lib/main.dart) for an example on how to use this package.

You can add optional parameters to the `showImagePickerDialog(context)` function call. These are:
|     Parameter     |  Explaination |
|-------------------|---------------|
|       title       |  left-aligned |
|   titleTextSize   |    centered   |
|     iconSize      | right-aligned |
|   iconTextSize    | right-aligned |
| spaceBetweenIcons | right-aligned |
|   makePhotoText   | right-aligned |
|   makePhotoIcon   | right-aligned |
|  selectImageText  | right-aligned |
|  selectImageIcon  | right-aligned |
|  closeButtonText  | right-aligned |

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
