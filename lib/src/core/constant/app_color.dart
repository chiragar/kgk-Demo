import 'package:flutter/material.dart';

class AppColor {
  static const Color kColor = Color(0xFF77C5C1);
  static const Color kColor2 = Color(0xFFeab57c);
  static const Color kWhiteColor = Color(0xffffffff);
  static const Color kBlack = Color(0xFF000000);
  static const Color kLightBlack = Color(0xFF181818);
  static const Color kGray = Color(0xFF807F7F);
  static const Color kColor3 = Color(0xFF313943);
  static const Color kColor4 = Color(0xFF4a707a);
  static const Color kLightYellowColor = Color(0xFFD3BF5F);
  static const Color kLightTealColor = Color(0xff4fbe9e);

  Color defaultLightWhite = kWhiteColor.withOpacity(0.1);

  static const Color ktransparent = Colors.transparent;
  static const Color kGrayText = Color(0xFF596B90);
  static const Color drawerBgColor = Color(0xFFFEF4F4);
  static const Color appBarColor = Color(0xFFEC3237);
  static const Color drawerTextColor = Color(0xFF101828);
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft, stops: [
    0.3,
    0.9
  ],
    colors: [
      Color(0xFF4286f4),
      Color(0xFF4286f4),
    ],
  );
}
