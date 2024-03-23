// File: custom_theme.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: A custom theme for this flutter project

import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF39B54A),
    backgroundColor: Color(0xFFFDFFF5),
    colorScheme: ColorScheme.light(
      primary: Color(0xFF39B54A),
      secondary: Color(0xFFEF3300),
      background: Color(0xFFFDFFF5),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Popins',
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Popins',
      ),
      button: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Use white for all buttons
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF39B54A),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white), // Use white for text in TextButtons
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF39B54A)), // Use primary color for all ElevatedButtons
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: Color(0xFF39B54A))), // Use primary color for border
        foregroundColor: MaterialStateProperty.all(Color(0xFF39B54A)), // Use primary color for text
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF39B54A),
    backgroundColor: Color(0xFF001E00),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF39B54A),
      secondary: Color(0xFFEF3300),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Popins',
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontFamily: 'Popins',
      ),
      button: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Use white for all buttons
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF39B54A),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white), // Use white for text in TextButtons
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF39B54A)), // Use primary color for all ElevatedButtons
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: Color(0xFF39B54A))), // Use primary color for border
        foregroundColor: MaterialStateProperty.all(Color(0xFF39B54A)), // Use primary color for text
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
  );
}
