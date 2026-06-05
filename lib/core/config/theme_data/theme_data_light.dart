import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_font.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.p0,
    brightness: Brightness.light,
    fontFamily: AppFont.generalSans,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.p0,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.p0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10)
        )
      )
    )
  );
}
