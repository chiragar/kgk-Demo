import 'package:flutter/material.dart';
import 'package:kgk/src/core/constant/app_color.dart';

class CustomTextWidget extends StatelessWidget {
  final String titleTxt;
  final Color txtColor;
  final FontWeight fw;
  const CustomTextWidget(
      {super.key,
      required this.titleTxt,
      this.txtColor = AppColor.drawerTextColor,
      this.fw = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleTxt,
      style: TextStyle(
        color: txtColor,
        fontSize: 12,
        fontFamily: 'SF Pro Display',
        fontWeight: fw,
        height: 1.67,
        letterSpacing: 0.12,
      ),
    );
  }
}
