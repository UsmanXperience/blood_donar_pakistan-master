import 'package:blood_donar_pakistan/custom_logo/phone_numb_custom.dart';
import 'package:blood_donar_pakistan/custom_logo/top_desing.dart';
import 'package:blood_donar_pakistan/extension/extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';
import 'login_page.dart';
import 'dart:async';

class OtpScreen extends StatefulWidget {
  static const String id = 'OtpScreen';

  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String phoneNumber;
  final List<TextEditingController> _controllers = List.generate(
    4,

    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  late Timer _timer;
  int _remainingSeconds = 240;
  String _timeDisplay = "04:00";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
          final minutes = _remainingSeconds ~/ 60;
          final seconds = _remainingSeconds % 60;
          _timeDisplay =
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        });
      }
    });
  }

  @override
  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  bool isValidPhoneNumber(String phone) {
    final RegExp phoneRegex = RegExp(r'^\d{11}$');
    return phoneRegex.hasMatch(phone);
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
  }
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
                  child: TopDesign(
                    firstText: "Blood Donar",
                    secondText: " P a k i s t a n",
                    imagePath: "assets/logo.png",
                    backgroundColor: Colors.red,
                    isLeftAligned: false,
                  ),
                ),
                Column(
                  children: [
                    PhoneNumberCard(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      onNext: () {
                        String otp = _controllers.map((c) => c.text).join();

                        if (otp.length == 4) {
                          print("Entered OTP is $otp");

                          Navigator.pushNamed(context, LoginPage.id);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter the complete 4-digit OTP',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },

                      title: 'PHONE VERIFICATION',
                      subtitle:
                          'Enter the OTP we have sent on your mobile number $phoneNumber',
                      buttonText: 'VERIFY',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              width: 50,
                              child: RawKeyboardListener(
                                focusNode: FocusNode(),
                                onKey: (event) {
                                  if (event.isKeyPressed(
                                    LogicalKeyboardKey.backspace,
                                  )) {
                                    if (_controllers[index].text.isEmpty &&
                                        index > 0) {
                                      FocusScope.of(
                                        context,
                                      ).requestFocus(_focusNodes[index - 1]);
                                    }
                                  }
                                },
                                child: TextField(
                                  controller: _controllers[index],
                                  focusNode: _focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Lexend',
                                  ),
                                  decoration: const InputDecoration(
                                    counterText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      if (index < _focusNodes.length - 1) {
                                        FocusScope.of(
                                          context,
                                        ).requestFocus(_focusNodes[index + 1]);
                                      } else {
                                        _focusNodes[index].unfocus();
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Text.rich(
                      TextSpan(
                        text: 'Valid for 4 minuets ',
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lexend',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: _timeDisplay.substring(0, 3),
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: _timeDisplay.substring(3),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
