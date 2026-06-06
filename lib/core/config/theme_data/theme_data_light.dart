import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_font.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';

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
        padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 84),
        backgroundColor: AppColor.p900,
        foregroundColor: AppColor.p0,
        textStyle: AppTextStyle.b1m,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.p100, style: BorderStyle.solid),
        gapPadding: BorderSide.strokeAlignCenter
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.p100, style: BorderStyle.solid),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.p100, style: BorderStyle.solid),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.error, style: BorderStyle.solid),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.error, style: BorderStyle.solid),
      ),
    ),
  );
}
