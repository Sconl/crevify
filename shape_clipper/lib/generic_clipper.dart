// generic_clipper.dart
import 'package:flutter/material.dart';

class GenericClipper extends CustomClipper<Path> {
  final double clipRadius; // Generic corner radius for common use

  const GenericClipper({this.clipRadius = 0.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    // Add your base path adjustments here (initially empty)
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
