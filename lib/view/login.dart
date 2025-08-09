import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:blood_donar_pakistan/view/otp_screen.dart';
import 'package:blood_donar_pakistan/custom_logo/phone_numb_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_logo/top_desing.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';

  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  // Function to validate 11-digit phone number
  bool isValidPhoneNumber(String phone) {
    final RegExp phoneRegex = RegExp(r'^\d{11}$');
    return phoneRegex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        // Unfocus only when tapping outside the focused widget
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
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
                      String phoneNumber = phoneController.text.trim();
                      if (isValidPhoneNumber(phoneNumber)) {
                        Navigator.pushNamed(
                          context,
                          OtpScreen.id,
                          arguments: phoneNumber,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Please enter a valid 11-digit phone number',
                            ),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    title: 'PHONE NUMBER',
                    subtitle:
                        'We only need your phone number for authentication purposes and will not contact you otherwise.',
                    buttonText: 'NEXT',
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      decoration: const InputDecoration(
                        labelText: 'PHONE NUMBER',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Lexend',
                          fontSize: 12,
                        ),
                        hintText: 'TYPE YOUR PHONE NUMBER',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Lexend',
                          fontSize: 12,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        counterText: '',
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight > 600 ? 120 : 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
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
                      String phoneNumber = phoneController.text.trim();
                      if (isValidPhoneNumber(phoneNumber)) {
                        // Add resend OTP logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('OTP resent successfully'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please enter a valid phone number to resend OTP',
                            ),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: const Text(
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
