import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'app_loader.dart';

/// A custom widget for displaying network images with caching, placeholders, and error states.
class CustomNetworkImage extends StatelessWidget {
  /// The URL of the image to display.
  final String imageUrl;
  
  /// Optional width of the image.
  final double? width;
  
  /// Optional height of the image.
  final double? height;
  
  /// How the image should be inscribed into the box.
  final BoxFit fit;
  
  /// Optional border radius for clipping the image.
  final BorderRadius? borderRadius;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Add support for different placeholder styles (e.g., Shimmer).
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => const AppLoader(size: 20),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade200,
          child: const Icon(Icons.error_outline, color: Colors.grey),
        ),
      ),
    );
  }
}
