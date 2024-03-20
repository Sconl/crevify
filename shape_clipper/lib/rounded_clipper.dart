import 'package:flutter/material.dart';

class RoundedClipper extends CustomClipper<Path> {
  final double cornerRadius; // Adjust corner radius

  const RoundedClipper({this.cornerRadius = 20.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start path at top-left corner with a radius
    path.moveTo(cornerRadius, 0.0);

    // Draw lines with radius for top-right, bottom-right, and bottom-left corners
    path.lineTo(size.width - cornerRadius, 0.0);
    path.arcToPoint(Offset(size.width, cornerRadius), radius: Radius.circular(cornerRadius), clockwise: false);
    path.lineTo(size.width, size.height - cornerRadius);
    path.arcToPoint(Offset(size.width - cornerRadius, size.height), radius: Radius.circular(cornerRadius), clockwise: false);
    path.lineTo(cornerRadius, size.height);
    path.arcToPoint(Offset(0.0, size.height - cornerRadius), radius: Radius.circular(cornerRadius), clockwise: false);
    path.lineTo(0.0, cornerRadius);
    path.arcToPoint(Offset(cornerRadius, 0.0), radius: Radius.circular(cornerRadius), clockwise: false);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
