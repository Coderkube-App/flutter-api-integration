import 'package:flutter/material.dart';
import '../theme/app_text_style.dart';
import '../theme/app_colors.dart';

/// A utility class for displaying standardized alert dialogs.
class AppDialog {
  /// Shows a general-purpose alert dialog with customizable title, message, and buttons.
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: AppTextStyle.heading1.copyWith(fontSize: 20)),
        content: Text(message, style: AppTextStyle.body1),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: onCancel ?? () => Navigator.pop(context),
              child: Text(cancelText, style: const TextStyle(color: Colors.grey)),
            ),
          TextButton(
            onPressed: onConfirm ?? () => Navigator.pop(context),
            child: Text(confirmText ?? 'OK', style: const TextStyle(color: AppColors.primary)),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  /// Shows a specialized error dialog with a default "Error" title.
  static void showError({
    required BuildContext context,
    required String message,
  }) {
    // TODO: Add support for an optional error icon in the dialog.
    show(
      context: context,
      title: 'Error',
      message: message,
      confirmText: 'Dismiss',
    );
  }
}
