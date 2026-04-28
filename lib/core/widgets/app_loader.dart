import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A simple circular progress indicator widget with customizable size and color.
class AppLoader extends StatelessWidget {
  /// The width and height of the loader.
  final double size;
  
  /// The color of the progress indicator. Defaults to [AppColors.primary].
  final Color? color;

  const AppLoader({
    super.key,
    this.size = 30.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
          strokeWidth: 3,
        ),
      ),
    );
  }
}

/// A helper class to show and hide a global loading overlay.
/// 
/// This is useful for blocking user interaction during long-running asynchronous operations.
class AppOverlayLoader {
  /// Displays a non-dismissible loading dialog.
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const PopScope(
        canPop: false,
        child: AppLoader(),
      ),
    );
  }

  /// Closes the currently displayed loading dialog.
  static void hide(BuildContext context) {
    // TODO: Add a check to ensure we only pop if a loader is actually showing.
    Navigator.pop(context);
  }
}
