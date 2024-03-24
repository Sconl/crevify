// File: home_page.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: homescreen for crevify app

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../shared/theme/custom_theme.dart'; // Updated import for custom_theme.dart
import '../widgets/hero_banner.dart'; // Import HeroBanner widget
import '../services/image_service.dart'; // Import image_service.dart
import '../widgets/user_info_widget.dart'; // Import UserInfoWidget

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor, // Set the background color to follow the theme of the device
        child: Stack(
          children: [
            Positioned(
              top: 0.12 * MediaQuery.of(context).size.height, // Move the custom shape slightly lower
              right: 0, // Move the custom shape to the right edge of the screen
              child: CustomPaint(
                size: Size(1.1 * MediaQuery.of(context).size.width / 4, 1.1 * MediaQuery.of(context).size.width / 4), // Increase the size of the custom shape circle by 10%
                painter: _CustomShapePainter(), // Custom shape painter
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Align all widgets to the center
                children: [
                  UserInfoWidget(user: user), // Add the UserInfoWidget at the top immediately after the AppBar
                  HeroBanner(
                    images: fetchImageUrls(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40.0,
              right: 20.0,
              child: IconButton(
                icon: Icon(Icons.menu), // Hamburger menu icon
                onPressed: () {
                  // Handle hamburger menu press
                },
              ),
            ),
            Positioned(
              top: 40.0,
              right: 60.0,
              child: IconButton(
                icon: Icon(Icons.favorite), // Favorites icon
                onPressed: () {
                  // Handle favorites icon press
                },
              ),
            ),
            Positioned(
              top: 40.0,
              right: 100.0,
              child: IconButton(
                icon: Icon(Icons.notifications), // Notification 'bell' icon
                onPressed: () {
                  // Handle notification icon press
                },
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
