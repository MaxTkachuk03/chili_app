import 'package:chili_app/resources/resources.dart';
import 'package:flutter/material.dart';

class AppStyles {
  const AppStyles._();

  static const title = TextStyle(
    color: AppColors.defaultWhiteColor,
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
  );

  static const displayLarge = TextStyle(
    color: AppColors.defaultWhiteColor,
    fontWeight: FontWeight.w700,
    fontSize: 24.0,
  );

  static const displaySmall = TextStyle(
    color: AppColors.defaultWhiteColor,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );

  static const labelLarge = TextStyle(
    color: AppColors.defaultBlack26Color,
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
  );

  static const buttonStyle = ButtonStyle(
    iconColor: MaterialStatePropertyAll(AppColors.defaultWhiteColor),
  );
}
