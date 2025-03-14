import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kgk/src/core/constant/app_color.dart';
import 'package:kgk/src/core/constant/app_navigation.dart';
import 'package:kgk/src/core/constant/app_textstyle.dart';
import 'package:kgk/src/ui/screen/filter_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => AppNavigation.pushAndRemoveUntil(FilterScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(gradient: AppColor.buttonGradient),
          ),
          Center(
              child: Text(
            "KGK Demo \nChirag Rathod",
            textAlign: TextAlign.center,
            style: AppTextStyle.ts24(color: AppColor.kWhiteColor),
          ))
        ],
      ),
    );
  }
}
