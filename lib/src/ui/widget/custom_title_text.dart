import 'package:flutter/material.dart';
import 'package:kgk/src/core/constant/app_color.dart';

class CustomTitleTextWidget extends StatelessWidget {
  final String title;

  const CustomTitleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.013),
      child: Text(title.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColor.kGrayText,
          )),
    );
  }
}
