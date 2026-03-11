import 'package:dashyou/ui/styles/app_theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AppOutputTheme {
  static TextTheme getTheme(ThemeColors palette) => TextTheme(
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: palette.titleColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: palette.mediumTitleColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: palette.mediumTitleColor,
    ),
  );
}