import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kgk/src/core/constant/app_textstyle.dart';

import '../constant/app_color.dart';

class Themes {
  static _border([Color color = AppColor.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColor.kColor4,
      secondary: AppColor.kColor4,
    ),
    appBarTheme:  AppBarTheme(
        elevation: 0,
        backgroundColor: AppColor.appBarColor,
        titleTextStyle: AppTextStyle.ts16(
            color: AppColor.kWhiteColor, fontWeight: FontWeight.w600),
        iconTheme: IconThemeData(color: AppColor.kWhiteColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.ktransparent,
        )),
    canvasColor: AppColor.kColor4,

    scaffoldBackgroundColor: AppColor.kWhiteColor,
    inputDecorationTheme: InputDecorationTheme(
        border: _border(),
        enabledBorder: _border(),
        contentPadding: const EdgeInsets.all(8),
        focusedBorder: _border(),
        focusedErrorBorder: _border(AppColor.errorBorderColor),
        errorBorder: _border(AppColor.errorBorderColor),
        errorStyle: AppTextStyle.ts14(
            color: AppColor.errorTextColor, fontWeight: FontWeight.w400),
        hintStyle: AppTextStyle.hintTextStyle()),

  );
}
