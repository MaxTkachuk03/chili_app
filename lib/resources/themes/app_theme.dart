import 'package:chili_app/resources/resources.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatch),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: AppStyles.title,
    ),
    textTheme: const TextTheme(
      displayLarge: AppStyles.displayLarge,
      displaySmall: AppStyles.displaySmall,
      labelLarge: AppStyles.labelLarge,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: AppStyles.buttonStyle,
    ),
  );
}
