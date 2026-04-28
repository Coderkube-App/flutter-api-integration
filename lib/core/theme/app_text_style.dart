import 'package:flutter/material.dart';
import 'app_colors.dart';

/// A central repository for all [TextStyle] definitions used across the app.
/// 
/// Consistently using these styles ensures a unified look and feel.
class AppTextStyle {
  /// Style for primary headings (e.g., page titles).
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: 'Kanit',
  );

  /// Style for regular body text.
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Kanit',
  );

  /// Style for text inside buttons.
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Kanit',
  );

  /// Style for small labels or secondary information.
  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    fontFamily: 'Kanit',
  );
}
