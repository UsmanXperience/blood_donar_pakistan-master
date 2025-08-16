import 'package:blood_donar_pakistan/custom_logo/elevated_button.dart';
import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

import '../custom_logo/hint_text_custom.dart';
import 'blood_grp_detail.dart';
import 'creat_account.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
          bottom: screenHeight * 0.05,
          right: screenWidth * 0.05,
          left: screenWidth * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HintTextCustom(label: 'Email', hint: 'example@gmail.com'),
                SizedBox(height: screenHeight * 0.04),
                HintTextCustom(
                  label: 'Password',
                  hint: 'Password',
                  obscure: true,
                ),
              ],
            ),

            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Elevated_Button(
              text: 'login',
              textColor: Colors.white,
              backgroundcolor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, BloodGrpDetail.id);
              },
              horizontalPadding: screenWidth * 0.38,
              verticalPadding: screenHeight * 0.015,
            ),
            Center(
              child: Text(
                'Or',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: 'Lexend',
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Sign-In Button
                SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Google Sign In pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 2,
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.14,
                          height: screenHeight * 0.14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: EdgeInsets.all(screenWidth * 0.010),
                          child: Image.asset(
                            'assets/google.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                // Facebook Round Button
                GestureDetector(
                  onTap: () {
                    print('Facebook button pressed');
                  },
                  child: Container(
                    width: screenWidth * 0.16,
                    height: screenWidth * 0.16,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: screenWidth * 0.13,
                        height: screenHeight * 0.13,
                        decoration: BoxDecoration(
                          color: Colors.blue[500],
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'f',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lexend',
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CreatAccount.id);
                },
                child: Text(
                  'Create an account?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
