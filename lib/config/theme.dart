import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      useMaterial3: true,
      // scaffoldBackgroundColor: primaryColor,
      // primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Inter',
      colorSchemeSeed: primaryColor,
      textTheme: textTheme());
}

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(color: Colors.black, fontSize: 28),
    headlineMedium: TextStyle(
        color: Color.fromRGBO(85, 85, 85, 1),
        fontSize: 18,
        fontWeight: FontWeight.w400),
    headlineSmall: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
        color: Color.fromRGBO(153, 157, 163, 1),
        fontSize: 16,
        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
        color: Color.fromRGBO(153, 157, 163, 1),
        fontSize: 12,
        fontWeight: FontWeight.w400),
  );
}

const Color primaryColor = Color.fromRGBO(80, 141, 105, 1);
const Color secondaryColor = Color.fromRGBO(154, 222, 123, 1);
const Color thirdColor = Color.fromRGBO(238, 242, 150, 1);
const Color failedColor = Color.fromRGBO(255, 143, 143, 1);

const double defaultBorderRadius = 8.0;

const double largePadding = 24.0;
const double minPadding = 16.0;
const double defaultWidgetHeight = 48.0;
