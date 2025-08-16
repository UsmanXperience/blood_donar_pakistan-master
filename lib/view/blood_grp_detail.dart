import 'package:blood_donar_pakistan/custom_logo/top_desing.dart';
import 'package:blood_donar_pakistan/view/login.dart';
import 'package:flutter/material.dart';

class BloodGrpDetail extends StatelessWidget {
  static const String id = 'BloodGrpDetail';

  const BloodGrpDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                  fiveText: 'blood group',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
