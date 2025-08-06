import 'package:blood_donar_pakistan/routes/routes.dart';
import 'package:blood_donar_pakistan/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: AppRoutes.routes,
    );
  }
}
