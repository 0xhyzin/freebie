import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_font.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.p0,
    brightness: Brightness.light,
    fontFamily: AppFont.generalSans,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.success,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColor.error,
      displayColor: AppColor.error,
    ),
  );
}
