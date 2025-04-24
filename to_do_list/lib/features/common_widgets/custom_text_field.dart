import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// A customizable text field widget that follows the app's design system.
/// Supports various states and customizations like labels, hints, and error states.
class CustomTextField extends StatelessWidget {
  /// The hint text to display when the text field is empty
  final String? hint;

  /// The label text to display above the text field
  final String? label;

  /// The error text to display below the text field
  final String? errorText;

  /// Whether the text field should obscure the text (for passwords)
  final bool obscureText;

  /// The controller for the text field
  final TextEditingController? controller;

  /// The keyboard type for the text field
  final TextInputType? keyboardType;

  /// The text input action for the text field
  final TextInputAction? textInputAction;

  /// Maximum number of lines for the text field
  final int? maxLines;

  /// Whether the text field is enabled
  final bool enabled;

  /// Whether the text field is read-only
  final bool readOnly;

  /// The prefix icon to display before the text
  final Widget? prefixIcon;

  /// The suffix icon to display after the text
  final Widget? suffixIcon;

  /// The style for the input text
  final TextStyle? style;

  /// The style for the label text
  final TextStyle? labelStyle;

  /// The style for the hint text
  final TextStyle? hintStyle;

  /// The style for the error text
  final TextStyle? errorStyle;

  /// Callback function when the text changes
  final Function(String)? onChanged;

  /// Creates a custom text field with the given properties
  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    this.errorText,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: onChanged,
      style: style ?? AppTextStyles.bodyLarge,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFCDCDCD),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFCDCDCD),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        labelStyle: labelStyle ?? AppTextStyles.label,
        hintStyle: hintStyle ?? AppTextStyles.hint,
        errorStyle: errorStyle ?? AppTextStyles.error,
      ),
    );
  }
}
