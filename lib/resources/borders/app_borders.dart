import 'package:chili_app/resources/resources.dart';
import 'package:flutter/material.dart';

class AppBorder {
  const AppBorder._();

  static const enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.defaultWhiteColor, width: 2),
  );

  static const focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.defaultWhiteColor, width: 2),
  );
}
