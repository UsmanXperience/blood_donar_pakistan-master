import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

class TopDesing extends StatelessWidget {
  final Color? backgroundColor;
  final String firsText;
  final String secondText;
  final String imagePath;

  const TopDesing({
    super.key,
    this.backgroundColor,
    required this.firsText,
    required this.secondText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return Container(
      height: screenHeight * 0.35,
      width: screenWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.red,
      ),
      child: Padding(padding: EdgeInsets.only(top: screenHeight*0.02),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: screenHeight * 0.12,
                width: screenWidth * 0.2,
                fit: BoxFit.contain,
              ),

              Text(
                firsText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                secondText,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                  letterSpacing: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
