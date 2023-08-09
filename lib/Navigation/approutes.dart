import 'package:task6/presentation/screens/home_page_screen.dart';
import 'package:task6/presentation/screens/loading_screen.dart';
import 'package:task6/presentation/screens/sign_in.dart';
import 'package:task6/presentation/screens/sign_up.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String loading = '/loading';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePageScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case loading:
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      default:
        return null;
    }
  }
}
