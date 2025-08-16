import 'package:blood_donar_pakistan/custom_logo/elevated_button.dart';
import 'package:blood_donar_pakistan/custom_logo/hint_text_custom.dart';
import 'package:blood_donar_pakistan/custom_logo/top_desing.dart';
import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:blood_donar_pakistan/view/login_page.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class CreatAccount extends StatelessWidget {
  static const String id = 'CreatAccount';

  CreatAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    final List<Map<String, dynamic>> fields = [
      {'label': 'Full Name', 'hint': 'Enter your name', 'obscure': false},
      {'label': 'Email', 'hint': 'example@gmail.com', 'obscure': false},
      {'label': 'Password', 'hint': 'Password', 'obscure': true},
      {'label': 'Confirm Password', 'hint': 'Password', 'obscure': true},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: HeaderClipper(),
                child: TopDesign(
                  firstText: "Signup for a new account",
                  thirdText: 'Creat account',
                  fourText: 'Enter your account detail',
                  isLeftAligned: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 5.0,
                ),
                child: Column(
                  children: List.generate(fields.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.025),
                      child: HintTextCustom(
                        label: fields[index]['label'],
                        hint: fields[index]['hint'],
                        obscure: fields[index]['obscure'],
                      ),
                    );
                  }),
                ),
              ),

              Elevated_Button(
                text: 'login',
                textColor: Colors.white,
                backgroundcolor: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                horizontalPadding: screenWidth * 0.38,
                verticalPadding: screenHeight * 0.015,
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'Lexend',
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                        fontFamily: 'Lexend',
                        fontSize: 20,
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
