import 'package:flutter/material.dart';
import '../theme_colors.dart';

class AppInputTheme {
  static InputDecorationTheme getTheme(ThemeColors palette) =>
      InputDecorationTheme(
        filled: true,
        fillColor: palette.textFieldBackground,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        hintStyle: TextStyle(color: palette.mediumTitleColor, fontSize: 14),
        prefixIconColor: palette.textFieldPrefixIcon,
        suffixIconColor: palette.textFieldSuffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent), //BorderSide.none,
        ),

        errorStyle: TextStyle(color: Color(0xFFFF0000), fontSize: 12),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF0000), width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF0000), width: 1.5),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: palette.elevatedButtonBackground,
            width: 1.5,
          ),
        ),
      );
}
