import 'dart:ui';

import 'package:patas_unidas_mobile/shared/theme/app_colors.dart';
import 'package:patas_unidas_mobile/shared/theme/theme_colors.dart';

class LightAppColors implements ThemeColors {
  const LightAppColors();

  @override
  Color get primaryBackground => const Color(0xFFECECEC);
  @override
  Color get textFieldBackground => const Color(0xFFE5E5E5); // Campos de texto (Login)
  @override
  Color get textFieldPrefixIcon => const Color(0xFF707070);

  @override
  Color get textFieldSuffixIcon => const Color(0xFF707070);

  @override
  Color get textFieldBorderSideColor => AppColors.transparent;

  @override
  Color get elevatedButtonBackground => const Color(0xFF5CC6BA);

  @override
  Color get elevatedButtonColor => AppColors.white;

  @override
  Color get titleColor => const Color(0xFF333333); // Fazer Login:
  @override
  Color get mediumTitleColor => const Color(0xFF8E8E8E);

  @override
  // TODO: implement primaryColor
  Color get primaryColor => AppColors.primary;

  @override
  // TODO: implement secondaryColor
  Color get secondaryColor => AppColors.secondary;

  @override
  // TODO: implement iconColor
  Color get iconColor => AppColors.black;
}
