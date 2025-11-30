import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'app_colors.dart';

part 'app_themes.tailor.dart';

@TailorMixin()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  /// You can use required / named / optional parameters in the constructor
  // const MyTheme(this.background);
  // const MyTheme([this.background = Colors.blue])
  const AppTheme({
    required this.background,
    required this.backgroundLight,
    required this.backgroundDark,
    required this.text,
    required this.textMuted,
    required this.highlight,
    required this.border,
    required this.borderMuted,
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.warning,
    required this.success,
    required this.info,
    required this.header,
    required this.headerSmall,
    required this.body,
    required this.description,
  });

  @override
  final Color background;
  @override
  final Color backgroundLight;
  @override
  final Color backgroundDark;
  @override
  final Color text;
  @override
  final Color textMuted;
  @override
  final Color highlight;
  @override
  final Color border;
  @override
  final Color borderMuted;
  @override
  final Color primary;
  @override
  final Color secondary;
  @override
  final Color danger;
  @override
  final Color warning;
  @override
  final Color success;
  @override
  final Color info;

  @override
  final TextStyle header;
  @override
  final TextStyle headerSmall;

  @override
  final TextStyle body;
  @override
  final TextStyle description;
}

final lightAppTheme = AppTheme(
  background: AppColors.white5,
  backgroundLight: AppColors.white2,
  backgroundDark: AppColors.white10,
  text: AppColors.blue90,
  textMuted: AppColors.blue60,
  highlight: AppColors.white,
  border: AppColors.blue45,
  borderMuted: AppColors.blue30,
  primary: AppColors.blue60,
  secondary: AppColors.orange90,
  danger: AppColors.red60,
  warning: AppColors.orange85,
  success: AppColors.green,
  info: AppColors.cyan65,
  header: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: AppColors.blue90,
    height: 1.4,
    letterSpacing: 0.95,
  ),
  headerSmall: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 18.0,
    fontWeight: FontWeight.w200,
    color: AppColors.blue60,
    fontStyle: FontStyle.italic,
    height: 1.4,
  ),
  body: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 16.0,
    color: AppColors.blue90,
  ),
  description: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 14.0,
    color: AppColors.blue60,
  ),
);

final darkAppTheme = AppTheme(
  background: AppColors.black10,
  backgroundLight: AppColors.black15,
  backgroundDark: AppColors.black,
  text: AppColors.white2,
  textMuted: AppColors.white20,
  highlight: AppColors.blue50,
  border: AppColors.blue60,
  borderMuted: AppColors.blue70,
  primary: AppColors.blue,
  secondary: AppColors.orange,
  danger: AppColors.red,
  warning: AppColors.orange70,
  success: AppColors.green55,
  info: AppColors.cyan,
  header: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: AppColors.white2,
    height: 1.4,
    letterSpacing: 0.95,
  ),
  headerSmall: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 18.0,
    fontWeight: FontWeight.w200,
    color: AppColors.white20,
    fontStyle: FontStyle.italic,
    height: 1.4,
  ),
  body: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 16.0,
    color: AppColors.white2,
  ),
  description: TextStyle(
    fontFamily: 'Ubuntu Sans',
    fontSize: 14.0,
    color: AppColors.white20,
  ),
);
