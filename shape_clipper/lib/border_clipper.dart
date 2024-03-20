import 'package:flutter/material.dart';
import '../generic_clipper.dart';

class BorderClipper extends GenericClipper {
  final double borderWidth; // Adjust border width

  const BorderClipper({this.borderWidth = 10.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Calculate inset values based on border width
    final double inset = borderWidth / 2;

    // Start path at top-left corner with inset
    path.moveTo(inset, inset);

    // Draw lines for the outer rectangle with inset
    path.lineTo(size.width - inset, inset);
    path.lineTo(size.width - inset, size.height - inset);
    path.lineTo(inset, size.height - inset);

    // Close the path to create a rectangle with a border
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
