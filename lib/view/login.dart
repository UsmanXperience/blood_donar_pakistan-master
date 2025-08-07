import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:blood_donar_pakistan/view/otp_screen.dart';
import 'package:blood_donar_pakistan/custom_logo/phone_numb_custom.dart';
import 'package:flutter/material.dart';

import '../custom_logo/top_desing.dart';

class Login extends StatelessWidget {
  static const String id = 'Login';

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: HeaderClipper(),
                  child: TopDesing(
                    backgroundColor: Colors.red,
                    firsText: 'Blood Donar',
                    secondText: 'P A K I S T A N',
                    imagePath: 'assets/logo.png',
                  ),
                ),
                PhoneNumberCard(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  onNext: () {
                    Navigator.pushNamed(context, OtpScreen.id);
                  },
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.22),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't get OTP? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.bold,
                    ),
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

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.lineTo(size.width * 0.80, size.height - 99);
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
