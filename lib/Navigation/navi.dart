import 'package:flutter/material.dart';
import 'approutes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navi {
  static void toHome(BuildContext context) {
    navigatorKey.currentState
        ?.popUntil((route) => route.settings.name == AppRoutes.home);
  }

  static void toSignIn(BuildContext context) {
    navigatorKey.currentState?.pushNamed(AppRoutes.signin);
  }

  static void toSignup(BuildContext context) {
    navigatorKey.currentState?.pushNamed(AppRoutes.signup);
  }

  static void back(BuildContext context) {
    navigatorKey.currentState?.pop();
  }

  static void toloading(BuildContext context) {
    navigatorKey.currentState?.pushNamed(AppRoutes.loading);
  }

  static void fromLoadingToHome(BuildContext context) {
    navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
  }
}
