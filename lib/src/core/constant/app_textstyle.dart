import 'package:flutter/material.dart';

import 'app_color.dart';


class AppTextStyle {
  static TextStyle hintTextStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColor.hintTextColor,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts10({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: 10,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts12({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: 12,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts14({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: 14,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts16({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts17({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: 17,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts18({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: 18,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts20({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts20Underline({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) {
    return TextStyle(
      decoration: TextDecoration.underline,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts22({
    double fontSize = 22,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle ts24({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
