import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// A utility class for picking images from the gallery or camera.
class AppImagePicker {
  static final ImagePicker _picker = ImagePicker();

  /// Picks a single image from the specified [source].
  /// 
  /// Returns a [File] if an image was picked, otherwise null.
  /// TODO: Add support for image cropping after selection.
  static Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 70,
      );
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      // TODO: Implement proper error logging and user notification for permission denials.
    }
    return null;
  }

  /// Picks multiple images from the gallery.
  /// 
  /// Returns a list of [File] objects.
  /// TODO: Implement a limit for the maximum number of images that can be picked.
  static Future<List<File>> pickMultiImage() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 70,
      );
      return images.map((image) => File(image.path)).toList();
    } catch (e) {
      // TODO: Handle potential errors during multi-image selection.
    }
    return [];
  }
}
