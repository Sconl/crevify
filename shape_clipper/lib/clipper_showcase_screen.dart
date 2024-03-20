import 'package:flutter/material.dart';
import 's_clipper.dart'; // Make sure to use the correct path to import the SClipper class

class ClipperShowcaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // Set the preferred size here (width and height)
        preferredSize: Size(double.infinity, 103.78), // Adjust height as needed
        child: AppBar(
          flexibleSpace: ClipPath(
            clipper: SClipper(), // Use your custom SClipper for shaping
            child: Container(
              color: Color(0xff8dc63f),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Clipper Showcase Screen'),
      ),
    );
  }
}
