import 'package:flutter/material.dart';
import 'dart:math' as math; // Import for mathematical functions

class NotchedClipper extends CustomClipper<Path> {
  final double notchSize; // Adjust size of the notch (relative to width)
  final double notchPosition; // Adjust horizontal position of the notch (0.0 to 1.0)

  const NotchedClipper({this.notchSize = 0.2, this.notchPosition = 0.5});

  @override
  Path getClip(Size size) {
    final path = Path();

    final double notchDepth = size.height * notchSize;
    final double notchX = size.width * notchPosition;

    // Start path at top-left corner
    path.moveTo(0.0, 0.0);

    // Draw line to the top-right corner
    path.lineTo(size.width, 0.0);

    // Create a curve for the notch
    path.quadraticBezierTo(
      notchX,
      0.0,
      notchX,
      notchDepth,
    );

    // Draw line to the bottom-right corner with a slight adjustment for notch depth
    path.lineTo(size.width, size.height - notchDepth);

    // Create another curve for the bottom notch (mirrored from top)
    path.quadraticBezierTo(
      notchX,
      size.height,
      notchX - (size.width * (1.0 - notchPosition)),
      size.height,
    );

    // Draw line to complete the bottom edge and close the path
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
