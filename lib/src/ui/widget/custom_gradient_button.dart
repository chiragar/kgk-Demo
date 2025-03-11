import 'package:flutter/material.dart';
import 'package:kgk/src/core/constant/app_color.dart';

class CustomGradientButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTaps;
  final double? buttonheight;
  final double? buttonWidth;
  const CustomGradientButtonWidget(
      {super.key,
      required this.buttonName,
      required this.onTaps,
      this.buttonheight,
      this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onTaps,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // Important for the gradient effect
      ),
      child: Container(
        alignment: Alignment.center,
        width: buttonWidth ?? size.width,
        height: buttonheight ?? size.height * 0.06,
        decoration: ShapeDecoration(
          gradient: AppColor.buttonGradient,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 18,
            color: AppColor.kWhiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
