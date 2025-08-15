import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

class TopDesing extends StatelessWidget {
  final Color? backgroundColor;
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final String? fourText;
  final String? imagePath;
  final bool isLeftAligned;

  const TopDesing({
    super.key,
    this.backgroundColor,
    this.firstText,
    this.secondText,
    this.thirdText,
    this.fourText,
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        color: backgroundColor ?? Colors.red, // Default color
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: isLeftAligned
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            if (imagePath != null) // Show image only if provided
              Image.asset(
                imagePath!,
                height: screenHeight * 0.12,
                width: screenWidth * 0.2,
                fit: BoxFit.contain,
              ),
            if (firstText != null) // Show text only if provided
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLeftAligned ? 30.0 : 0,
                ),
                child: Text(
                  firstText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            if (secondText != null) // Show text only if provided
              Text(
                secondText!,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                ),
              ),
            SizedBox(height: screenHeight * 0.01),
            if (thirdText != null) // Show text only if provided
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLeftAligned ? 30.0 : 0,
                ),
                child: Text(
                  thirdText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.01),
            if (fourText != null) // Show text only if provided
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLeftAligned ? 30.0 : 0,
                ),
                child: Text(
                  fourText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
