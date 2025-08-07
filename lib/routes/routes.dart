import 'package:flutter/material.dart';

import '../view/login.dart';
import '../view model/splash_screen.dart';
import '../view/otp_screen.dart';
import '../custom_logo/phone_numb_custom.dart';
class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => SplashScreen(),
    Login.id: (context) => Login(),
    OtpScreen.id: (context) =>OtpScreen(),


  };
}