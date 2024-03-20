// wavy_clipper.dart
import 'package:flutter/material.dart';
import '../generic_clipper.dart';  // Correct import path
import 'dart:math';  // Import for math functions

class WavyClipper extends GenericClipper {
  final double waveFrequency;  // Adjust wave frequency
  final double waveAmplitude;  // Adjust wave amplitude

  const WavyClipper({this.waveFrequency = 2.0, this.waveAmplitude = 10.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double waveLength = (size.width ~/ waveFrequency).toDouble();  // Cast to double

    path.moveTo(0.0, size.height * 2 / 3); // Adjust starting point for wavy pattern

    for (var x = 0.0; x < size.width; x += waveLength) {
      final double y = sin((x / waveLength) * pi * 2) * waveAmplitude + size.height;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }
}
