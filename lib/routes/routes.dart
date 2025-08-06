import 'package:flutter/material.dart';

import '../view/login.dart';
import '../view/splash_screen.dart';
class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => SplashScreen(),
    Login.id: (context) => Login(),
  };
}