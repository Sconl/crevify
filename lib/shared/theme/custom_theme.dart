// File: custom_theme.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: A custom theme for this flutter project

import 'package:flutter/material.dart';

// Define your colors here
const Color primaryColor = Color(0xFF39B54A);
const Color secondaryColor = Color(0xFFEF3300);
const Color lightBackgroundColor = Color(0xFFFDFFF5);
const Color darkBackgroundColor = Color(0xFF001E00);

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: lightBackgroundColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Popins',
        color: darkBackgroundColor, // Updated color to dark theme background color
      ),
      bodyLarge: TextStyle( // Replaced bodyText1 with bodyLarge
        fontSize: 16.0,
        fontFamily: 'Popins',
        color: darkBackgroundColor, // Updated color to dark theme background color
      ),
      labelLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: darkBackgroundColor, // Updated color to dark theme background color
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(darkBackgroundColor), // Updated color to dark theme background color
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor), // Use primary color for all ElevatedButtons
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: primaryColor)), // Use primary color for border
        foregroundColor: MaterialStateProperty.all(primaryColor), // Use primary color for text
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      background: darkBackgroundColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Popins',
        color: lightBackgroundColor, // Updated color to light theme background color
      ),
      bodyLarge: TextStyle( // Replaced bodyText1 with bodyLarge
        fontSize: 16.0,
        color: lightBackgroundColor, // Updated color to light theme background color
        fontFamily: 'Popins',
      ),
      labelLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: lightBackgroundColor, // Updated color to light theme background color
        fontFamily: 'Popins',
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(lightBackgroundColor), // Updated color to light theme background color
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor), // Use primary color for all ElevatedButtons
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: primaryColor)), // Use primary color for border
        foregroundColor: MaterialStateProperty.all(primaryColor), // Use primary color for text
        backgroundColor: MaterialStateProperty.all(Colors.transparent), // No fill color
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))), // Completely rounded edges
      ),
    ),
  );
}
