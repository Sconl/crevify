import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF8DC63F), // Adjusted primary color
    backgroundColor: Color(0xFFFAFFE6), // Adjusted background color
    colorScheme: ColorScheme.light(
      primary: Color(0xFF8DC63F), // Adjusted primary color
      secondary: Color(0xFF293462),
      background: Color(0xFFFAFFE6), // Adjusted background color
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
        color: Colors.white,
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF8DC63F), // Adjusted primary color
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF8DC63F), // Adjusted primary color
    backgroundColor: Color(0xFF001E00), // Adjusted background color
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF8DC63F), // Adjusted primary color
      secondary: Color(0xFF293462),
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
        color: Colors.white,
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF8DC63F), // Adjusted primary color
    ),
  );
}
