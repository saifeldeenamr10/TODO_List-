import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Text styles used throughout the application
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Heading styles
  static const TextStyle headingLarge = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headingSmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  // Label styles
  static const TextStyle label = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  // Hint styles
  static const TextStyle hint = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle hintSmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Error styles
  static const TextStyle error = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    height: 1.5,
  );

  static const TextStyle errorSmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    height: 1.5,
  );

  // Button styles
  static const TextStyle button = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1.5,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1.5,
  );

  // Caption styles
  static const TextStyle caption = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle captionSmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Overline styles
  static const TextStyle overline = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
    letterSpacing: 1.5,
  );

  static const TextStyle overlineSmall = TextStyle(
    fontFamily: 'LexendDeca',
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
    letterSpacing: 1.5,
  );
}
