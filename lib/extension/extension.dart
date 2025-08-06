import 'package:flutter/material.dart';
extension MediaQueryValues on BuildContext {
  Size get screensize =>MediaQuery.of(this).size;
  double get screenWidth => screensize.width;
  double get screenHeight => screensize.height;
}