
import 'package:flutter/material.dart';

import '../custom_logo/custom_logo.dart';
import '../view/login.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, Login.id);
    });


  }

  @override
  Widget build(BuildContext context) {

    return CustomSplashContent();
  }
}
