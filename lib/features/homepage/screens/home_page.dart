// File: home_page.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: homescreen for crevify app

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../shared/theme/custom_theme.dart'; // Updated import for custom_theme.dart
import '../widgets/hero_banner.dart'; // Import HeroBanner widget
import '../services/image_service.dart'; // Import image_service.dart

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor, // Set the AppBar's background color to match the rest of the screen
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu), // Hamburger menu icon
          onPressed: () {
            // Handle hamburger menu press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications), // Notification 'bell' icon
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.logout), // Logout button
            onPressed: () async {
              await FirebaseAuth.instance.signOut(); // Implement the actual logic to logout using Firebase
            },
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).backgroundColor, // Set the background color to follow the theme of the device
        child: Stack(
          children: [
            Positioned(
              top: 0.33 * MediaQuery.of(context).size.height, // Move the custom shape to about two-thirds of the screen's height from the bottom
              right: 0, // Move the custom shape to the right edge of the screen
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width / 4, MediaQuery.of(context).size.width / 4), // Reduce the size of the custom shape circle
                painter: _CustomShapePainter(), // Custom shape painter
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroBanner(
                    images: fetchImageUrls(),
                  ),
                  const Text(
                    'Welcome to the Home Page!',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Logged in as: ${user.displayName ?? user.email}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  // Add other content as needed based on user status
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = MyTheme.lightTheme.primaryColor // Set the color of the custom shape to the primary color
      ..style = PaintingStyle.fill;

    var path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width, 0), radius: size.width)) // Draw a circle
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
