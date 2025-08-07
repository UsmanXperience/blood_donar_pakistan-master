import 'package:blood_donar_pakistan/custom_logo/top_desing.dart';
import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class OtpScreen extends StatelessWidget {
  static const String id = 'OtpScreen';

  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: HeaderClipper(),
                  child: TopDesing(
                    firsText: 'Blood Donar',
                    secondText: 'P A K I S T A N',
                    imagePath: 'assets/logo.png',
                  ),
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
