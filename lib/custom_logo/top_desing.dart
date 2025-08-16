import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

class TopDesign extends StatelessWidget {
  final Color backgroundColor;
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final String? fourText;
  final String? fiveText;
  final String? imagePath;
  final bool isLeftAligned;

  const TopDesign({
    super.key,
    this.backgroundColor = Colors.red,
    this.firstText,
    this.secondText,
    this.thirdText,
    this.fourText,
    this.fiveText,
    this.imagePath,
    this.isLeftAligned = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return Container(
      height: screenHeight * 0.35,
      width: screenWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
            offset:  Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.06),
        child: Column(
          crossAxisAlignment:
          isLeftAligned ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                height: screenHeight * 0.12,
                width: screenWidth * 0.2,
                fit: BoxFit.contain,
              ),
            if (firstText != null)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isLeftAligned ? 30.0 : 0),
                child: Text(
                  firstText!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            if (secondText != null)
              Text(
                secondText!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                ),
              ),
            if (thirdText != null)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isLeftAligned ? 30.0 : 0),
                child: Text(
                  thirdText!,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.08,
                    color: Colors.white,
                    fontFamily: 'Lexend',

                  ),
                ),
              ),
            if (fourText != null)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isLeftAligned ? 30.0 : 0),
                child: Text(
                  fourText!,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            if (fiveText != null)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isLeftAligned ? 30.0 : 0),
                child: Text(
                  fiveText!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.10,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
