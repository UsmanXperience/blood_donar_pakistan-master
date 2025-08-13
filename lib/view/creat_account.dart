import 'package:blood_donar_pakistan/view/login.dart';
import 'package:flutter/material.dart';

class CreatAccount extends StatelessWidget {
  const CreatAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          Focus.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(children: [ClipPath(clipper: HeaderClipper())]),
        ),
      ),
    );
  }
}
