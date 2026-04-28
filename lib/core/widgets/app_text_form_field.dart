import 'package:flutter/material.dart';
import '../theme/app_text_style.dart';
import '../theme/app_colors.dart';

/// A custom text input field widget that follows the application's design system.
/// 
/// It provides a consistent look for [TextFormField]s with predefined borders,
/// text styles, and padding.
class AppTextFormField extends StatelessWidget {
  /// The controller for the text being edited.
  final TextEditingController? controller;
  
  /// Optional text that describes the input field.
  final String? labelText;
  
  /// Optional text that suggests what sort of input the field accepts.
  final String? hintText;
  
  /// Optional validator function to check the input text.
  final String? Function(String?)? validator;
  
  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;
  
  /// The type of information for which to optimize the text input control.
  final TextInputType keyboardType;
  
  /// An icon that appears before the editable part of the text field.
  final Widget? prefixIcon;
  
  /// An icon that appears after the editable part of the text field.
  final Widget? suffixIcon;
  
  /// Whether the text field is read-only.
  final bool readOnly;
  
  /// Called when the user taps on the text field.
  final VoidCallback? onTap;
  
  /// The maximum number of lines for the text field.
  final int maxLines;
  
  /// Called when the user changes the text in the field.
  final ValueChanged<String>? onChanged;

  const AppTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Add support for autofocus and auto-correct options.
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      onChanged: onChanged,
      style: AppTextStyle.body1,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: AppTextStyle.label,
        hintStyle: AppTextStyle.label.copyWith(color: Colors.grey.shade400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
