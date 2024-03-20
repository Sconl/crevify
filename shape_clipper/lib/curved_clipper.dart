import 'package:flutter/material.dart';
import 'package:shape_clipper/shape_clipper.dart'; // Import for CustomClipper

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final curveHeight = size.height * 0.3; // Adjust curve height as needed

    path.lineTo(0.0, size.height - curveHeight);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height,
      size.width,
      size.height - curveHeight,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
