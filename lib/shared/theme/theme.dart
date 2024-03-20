import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF39B54A),
    backgroundColor: Color(0xFFFDFFF5),
    colorScheme: ColorScheme.light(
      primary: Color(0xFF39B54A),
      secondary: Color(0xFFEF3300), // Updated secondary color
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
        color: Color(0xFFEF3300), // Updated button color
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF39B54A),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      buttonColor: Color(0xFFEF3300), // Updated button color
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF39B54A),
    backgroundColor: Color(0xFF001E00),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF39B54A),
      secondary: Color(0xFFEF3300), // Updated secondary color
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
        color: Color(0xFFEF3300), // Updated button color
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF39B54A),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      buttonColor: Color(0xFFEF3300), // Updated button color
    ),
  );
}
