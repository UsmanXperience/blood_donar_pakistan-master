import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

import 'login.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Color(0xFFFF3737),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/logo.png', width: 100, height: 100),
            ),
            Text(
              'Blood Donar',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'Lexend',
              ),
            ),
            Text(
              'P A K I S T A N',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
