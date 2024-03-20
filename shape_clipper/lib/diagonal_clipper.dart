import 'package:flutter/material.dart';
import 'dart:math' as math; // Import for mathematical functions

class DiagonalClipper extends CustomClipper<Path> {
  final double angle; // Adjust angle in degrees (0.0 to 180.0)

  const DiagonalClipper({this.angle = 45.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    final double opposite = size.height * math.sin(math.pi * angle / 180.0);
    final double adjacent = size.width * math.cos(math.pi * angle / 180.0);

    // Start path at top-left corner
    path.moveTo(0.0, 0.0);

    // Draw line to the bottom-right corner based on calculated opposite and adjacent values
    path.lineTo(adjacent, opposite);

    // Draw line to bottom-left corner (completing the rectangle)
    path.lineTo(size.width, size.height);

    // Close the path to create a rectangle with a diagonal cut
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
