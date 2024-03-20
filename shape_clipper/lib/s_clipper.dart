import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class SClipper extends CustomClipper<Path> {
  final double heightFactor;

  SClipper({this.heightFactor = 1});

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height * heightFactor;

    Path path_0 = Path();
    path_0.moveTo(width, 0);
    path_0.lineTo(width, height);
    path_0.cubicTo(width, height * 52.04 / 63.78, width * 181.78 / 191.3, height * 42.52 / 63.78, width * 170.04 / 191.3, height * 42.52 / 63.78);
    path_0.lineTo(width * 21.26 / 191.3, height * 42.52 / 63.78);
    path_0.cubicTo(width * 9.52 / 191.3, height * 42.52 / 63.78, 0, height * 33 / 63.78, 0, height * 21.26 / 63.78);
    path_0.lineTo(0, 0);
    path_0.lineTo(width, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
