import 'package:blood_donar_pakistan/custom_logo/phone_numb_custom.dart';
import 'package:blood_donar_pakistan/custom_logo/top_desing.dart';
import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';
import 'login_page.dart';
import 'dart:async';

class OtpScreen extends StatefulWidget {
  static const String id = 'OtpScreen';


  const OtpScreen({super.key, });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,

    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  late Timer _timer;
  int _remainingSeconds = 240; // 4 minutes
  String _timeDisplay = "04:00";

  FirebaseAuth auth = FirebaseAuth.instance;
  String _verificationId = "";
  @override
  void initState() {
    super.initState();
    _startTimer();
    sendOTP("+923471902927");


  }
  void sendOTP(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieval or instant verification
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification failed: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
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
  // ✅ Yahan paste karein
  void verifyOtpAndLogin(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP Verified Successfully")),
      );

      Navigator.pushReplacementNamed(context, LoginPage.id);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP: $e")),
      );
    }
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
                  child: TopDesing(
                    firsText: 'Blood Donar',
                    secondText: 'P A K I S T A N',
                    imagePath: 'assets/logo.png',
                  ),
                ),
                Column(
                  children: [
                    PhoneNumberCard(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      onNext: () {
                        String otp = _controllers.map((c) => c.text).join();

                        verifyOtpAndLogin(otp);
                      },

                      title: 'PHONE VERIFICATION',
                      subtitle:
                          'Enter the OTP we have sent on your mobile number: +3064567873',
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
                                      borderSide: BorderSide(color: Colors.black),
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
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: _timeDisplay.substring(3),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
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
