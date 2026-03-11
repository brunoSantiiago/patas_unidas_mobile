import 'dart:ui';

import 'package:patas_unidas_mobile/shared/theme/app_colors.dart';
import 'package:patas_unidas_mobile/shared/theme/theme_colors.dart';

class DarkAppColors implements ThemeColors {
  const DarkAppColors();

  @override
  Color get primaryBackground => const Color(0xFF121212);

  @override
  Color get textFieldBackground => const Color(0xFF1E1E1E);

  @override
  Color get textFieldPrefixIcon => const Color(0xFFAAAAAA);

  @override
  Color get textFieldSuffixIcon => const Color(0xFFAAAAAA);

  @override
  Color get textFieldBorderSideColor => const Color(0xFF333333);

  @override
  Color get elevatedButtonBackground => AppColors.primary;

  @override
  Color get elevatedButtonColor => AppColors.white;

  @override
  Color get titleColor => AppColors.white;

  @override
  Color get mediumTitleColor => AppColors.white70;

  @override
  Color get primaryColor => AppColors.secondary;

  @override
  Color get secondaryColor => AppColors.primary;

  @override
  Color get iconColor => AppColors.white;
}
