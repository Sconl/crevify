import 'package:flutter/material.dart';
import 'dart:math' as math; // Import for mathematical functions

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final double radius = math.min(size.width / 2, size.height / 2); // Ensure circle fits within widget size
    final center = Offset(size.width / 2, size.height / 2);

    path.addArc(Rect.fromCircle(center: center, radius: radius), 0.0, 2 * math.pi);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
