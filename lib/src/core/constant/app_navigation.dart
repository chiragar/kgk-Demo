import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppNavigation {
  ///app routes
  static pushTo(Widget screen) {
    Navigator.push(
        Utils.navigatorKey.currentContext!,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ));
  }

  static pushAndRemoveUntil(Widget screen) {
    Navigator.pushAndRemoveUntil(Utils.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (_) => screen), (v) => false);
  }

  static pushAndReplace(Widget screen) {
    Navigator.pushReplacement(Utils.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (_) => screen));
  }

  ///web routes
  static pushTONamed(String routeName) {
    Navigator.pushNamed(Utils.navigatorKey.currentContext!, routeName);
  }

  static pushNamedAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(
        Utils.navigatorKey.currentContext!, routeName, (v) => false);
  }
}
