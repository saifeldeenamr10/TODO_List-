import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// A customizable button widget that follows the app's design system.
/// Supports different states like loading, outlined, and custom styling.
class CustomButton extends StatelessWidget {
  /// The text to display on the button
  final String text;

  /// Callback function when the button is pressed
  final VoidCallback onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Custom background color for the button
  final Color? backgroundColor;

  /// Border radius for the button corners
  final double borderRadius;

  /// Creates a custom button with the given properties
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.borderRadius = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331,
      height: 48.01,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? AppColors.primary,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.primary;
              }
              if (states.contains(MaterialState.hovered)) {
                return AppColors.primary.withOpacity(0.8);
              }
              return Colors.transparent;
            },
          ),
        ),
        child: _buildButtonChild(),
      ),
    );
  }

  /// Builds the button's child widget based on the loading state
  Widget _buildButtonChild() {
    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: AppTextStyles.button,
          ),
        ],
      );
    }

    return Text(
      text,
      style: AppTextStyles.button,
    );
  }
}
