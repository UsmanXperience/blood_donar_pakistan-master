import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

class Elevated_Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundcolor;
  final VoidCallback onPressed;
  final double horizontalPadding;
  final double verticalPadding;

  const Elevated_Button({
    super.key,

    required this.text,
    required this.textColor,
    required this.backgroundcolor,
    required this.onPressed,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
