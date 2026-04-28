import 'package:flutter/material.dart';
import '../theme/app_text_style.dart';

/// A customizable dropdown form field widget designed for consistent styling across the app.
/// 
/// [T] represents the type of the value associated with each dropdown item.
class AppDropdown<T> extends StatelessWidget {
  /// The list of items the user can select from.
  final List<DropdownMenuItem<T>> items;
  
  /// The currently selected value.
  final T? value;
  
  /// Callback function called when the user selects an item.
  final ValueChanged<T?>? onChanged;
  
  /// Optional hint text shown when no value is selected.
  final String? hint;
  
  /// Optional label text displayed above the dropdown.
  final String? labelText;
  
  /// Optional validator function for form validation.
  final String? Function(T?)? validator;

  const AppDropdown({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.hint,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(labelText!, style: AppTextStyle.label),
          const SizedBox(height: 8),
        ],
        DropdownButtonFormField<T>(
          // TODO: Check if 'initialValue' is correct; usually 'value' is used for DropdownButtonFormField.
          initialValue: value,
          items: items,
          onChanged: onChanged,
          validator: validator,
          style: AppTextStyle.body1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyle.label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
