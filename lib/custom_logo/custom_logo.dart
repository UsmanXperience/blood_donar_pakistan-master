import 'package:flutter/material.dart';

class CustomSplashContent extends StatelessWidget {
  const CustomSplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF3737),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          const Text(
            'Blood Donor',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 50,
              color: Colors.white,
              fontFamily: 'Lexend',
            ),
          ),
          const Text(
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
    );
  }
}
