import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/app_color.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColor.kColor4,
      secondary: AppColor.kColor4,
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColor.appBarColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.ktransparent,
        )),
    canvasColor: AppColor.kColor4,
    scaffoldBackgroundColor: AppColor.kColor,
  );
}
