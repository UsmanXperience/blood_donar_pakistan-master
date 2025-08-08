import 'package:flutter/material.dart';
import 'package:blood_donar_pakistan/extension/extension.dart';

class PhoneNumberCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final VoidCallback onNext;
  final String title;
  final String subtitle;
  final Widget child;
  final String buttonText;

  const PhoneNumberCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onNext,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.259,
              left: 20,
              right: 20,
            ),
            child: Container(
              height: screenHeight * 0.42,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenHeight * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontFamily: 'Lexend',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.06),

                    child,
                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -25,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              child:  Text(
                buttonText,
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
