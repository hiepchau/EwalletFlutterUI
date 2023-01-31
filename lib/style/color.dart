import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const Color primary = Color(0xFF008fe5);
const Color secondary = Color(0xFF0144db);
const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);
const Color grey = Color(0xFF8e8e93);
const Color orange = Color(0xFFFF8647);
const Color yellow = Color(0xFFFED200);
const Color neon = Color(0xFF0FFdc1);
const Color red = Color(0xFFff3b30);
const Color green = Color(0xFF4cd964);
const Color teal = Color(0xFF009688);
const Color purple = Color(0xFF9c27b0);
const Color deepPurple = Color(0xFF673ab7);

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = primary;
  static const Color loginGradientEnd = green;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
