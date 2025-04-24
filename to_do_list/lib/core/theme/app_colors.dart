import 'package:flutter/material.dart';

/// Colors used throughout the application
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF149954);
  static const Color secondary = Color(0xFF2F9E44);
  static const Color accent = Color(0xFF40C057);

  // Neutral Colors
  static const Color background = Colors.white;
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF24252C);
  static const Color textSecondary = Color(0xFF6E6A7C);
  static const Color border = Color(0xFFCDCDCD);

  // Semantic Colors
  static const Color success = Color(0xFF40C057);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF2196F3);

  // Status Colors
  static const Color online = Color(0xFF40C057);
  static const Color offline = Color(0xFF6E6A7C);
  static const Color busy = Color(0xFFF44336);
  static const Color away = Color(0xFFFFA000);

  // Social Colors
  static const Color facebook = Color(0xFF1877F2);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color instagram = Color(0xFFE4405F);
  static const Color linkedin = Color(0xFF0A66C2);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF149954),
    Color(0xFF2F9E44),
  ];
  static const List<Color> secondaryGradient = [
    Color(0xFF2F9E44),
    Color(0xFF40C057),
  ];

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color backdrop = Color(0x40000000);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);
  static const Color shadowDark = Color(0x26000000);
}
