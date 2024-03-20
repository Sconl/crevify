import 'package:flutter/material.dart';
import 'package:shape_clipper/clipper_showcase_screen.dart'; // Import the class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clipper Showcase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClipperShowcaseScreen(), // Set ClipperShowcaseScreen as the home screen
    );
  }
}
