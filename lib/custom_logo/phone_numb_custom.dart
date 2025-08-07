import 'package:flutter/material.dart';
import 'package:blood_donar_pakistan/extension/extension.dart';

class PhoneNumberCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final VoidCallback onNext;

  const PhoneNumberCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onNext,
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
              height: screenHeight * 0.33,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
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
                    const Text(
                      'PHONE NUMBER',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "We only need your phone number for authentication purposes and will not contact you otherwise.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontFamily: 'Lexend',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextField(
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: 'PHONE NUMBER',
                        labelStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lexend',
                          color: Colors.black,
                        ),
                        hintText: 'TYPE YOUR PHONE NUMBER',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ✅ Stylish "Next" button (Floating)
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
              child: const Text(
                'Next',
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