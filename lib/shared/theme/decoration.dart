import 'package:flutter/material.dart';
import 'package:patas_unidas_mobile/shared/theme/app_colors.dart';

class StyleDecoration {
  static BoxDecoration decorationAppBar = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primary,
        AppColors.primary.withValues(alpha: 0.8),
        AppColors.primary.withValues(alpha: 0.6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    // color: AppColors.secondary, //Color(0xFF48D1A0), // Sua cor verde
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
  );
}
