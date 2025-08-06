import 'package:blood_donar_pakistan/extension/extension.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String id = 'Login';

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: screenHeight * 0.3,
                width: screenWidth,
                color: Color(0xFFFF3737),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: screenHeight * 0.12,
                      width: screenWidth * 0.2,
                    ),

                    Text(
                      'Blood Donar',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    Text(
                      'P A K I S T A N',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.25,
                    left: 30,
                    right: 30,
                  ),
                  child: Container(
                    height: screenHeight * 0.33,
                    width: screenWidth,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        right: screenHeight * 0.03,
                        left: screenHeight * 0.03,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Text(
                            'PHONE NUMBER',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          Text(
                            '“We only need your phone number for authentication"'
                                'purposes and will not contact you otherwise',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontFamily: 'Lexend',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'PHONE NUMBER',
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend',
                                color: Colors.black,
                              ),
                              hintText: 'TYPE YOUR PHONE NUMBER',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -20,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Submit',
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
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
