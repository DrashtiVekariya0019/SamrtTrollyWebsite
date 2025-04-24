import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle customStyle(
      {required double fontSize,
        required FontWeight fontWeight,
        required Color color,
        FontStyle fontStyle = FontStyle.normal,
        fontfamily='helvet01-webfont',
        double letterSpacing = 0}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        fontFamily: fontfamily,
        letterSpacing: letterSpacing);
  }
}
