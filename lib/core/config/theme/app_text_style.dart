import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_font.dart';

class AppTextStyle {
  const AppTextStyle._();

  // heading
  static const TextStyle h1sb = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 64,
    height: 0.8,
    letterSpacing: -0.5,
  );
  static const TextStyle h2sb = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 32,
    height: 1,
    letterSpacing: -0.5,
  );
  static const TextStyle h3sb = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 24,
    height: 1.2,
    letterSpacing: 0,
  );
  static const TextStyle h4sb = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    height: 1.2,
    letterSpacing: 0,
  );
  static const TextStyle h4m = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    height: 1.2,
    letterSpacing: 0,
  );

  //body

  static const TextStyle b1r = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
  );
  static const TextStyle b1m = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
  );
  static const TextStyle b1sb = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle b2r = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0,
  );
  static const TextStyle b2m = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0,
  );
  static const TextStyle b2sb = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle b3r = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    height: 1.4,
    letterSpacing: 0,
  );
  static const TextStyle b3m = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    height: 1.4,
    letterSpacing: 0,
  );
  static const TextStyle b3sb = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    height: 1.4,
    letterSpacing: 0,
  );
  static const TextStyle underLine = TextStyle(
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle email = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
    color: AppColor.p900,
  );
  static const TextStyle b1WithColor = TextStyle(
    fontFamily: AppFont.generalSans,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
    color: AppColor.p900,
  );
}
