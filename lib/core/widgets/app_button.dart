import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A primary action button widget with standard styling.
class AppButton extends StatelessWidget {
  /// The text to display on the button.
  final String text;
  
  /// Callback function when the button is pressed.
  final VoidCallback onPressed;
  
  /// Background color of the button. Defaults to [AppColors.primary].
  final Color? backgroundColor;
  
  /// Color of the text on the button. Defaults to white.
  final Color? textColor;
  
  /// Width of the button. Defaults to [double.infinity].
  final double width;
  
  /// Height of the button. Defaults to 50.0.
  final double height;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width = double.infinity,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Add support for an icon and a loading state (spinner inside the button).
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
