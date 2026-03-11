import 'package:flutter/material.dart';
import '../theme_colors.dart';

class CustomAppButtonTheme {
  static SegmentedButtonThemeData getSegmentedTheme(ThemeColors palette) {
    return SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        selectedBackgroundColor: palette.primaryColor,
        selectedForegroundColor: Colors.white,
        foregroundColor: palette.textFieldBackground,
        side: BorderSide(color: palette.primaryColor.withOpacity(0.5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static ElevatedButtonThemeData getElevatedTheme(ThemeColors palette) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: palette.elevatedButtonBackground,
          foregroundColor: palette.elevatedButtonColor,
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,

          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );

  static OutlinedButtonThemeData getOutlinedTheme(ThemeColors palette) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: palette.primaryColor,
          backgroundColor: Colors.transparent,
          side: BorderSide(color: palette.primaryColor, width: 1.6),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      );
}
