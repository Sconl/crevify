// File: homepage.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: homescreen for crevify app

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../shared/theme/custom_theme.dart'; // Updated import for custom_theme.dart
import '../widgets/hero_banner.dart'; // Import HeroBanner widget
import '../services/image_service.dart'; // Import image_service.dart
import '../widgets/user_info_widget.dart'; // Import UserInfoWidget
import '../services/animation.dart'; // Corrected import for CustomCircleAnimation
import '../widgets/navigation.dart'; // Corrected import for NavigationMenu

class HomePage extends StatefulWidget {
  final User user;

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CustomCircleAnimation _customCircleAnimation;
  bool _showNavigation = false; // Add this line

  @override
  void initState() {
    super.initState();
    // Don't use MediaQuery here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Now it's safe to use MediaQuery
    _customCircleAnimation = CustomCircleAnimation(
      child: CustomPaint(
        size: Size(1.1 * MediaQuery.of(context).size.width / 4, 1.1 * MediaQuery.of(context).size.width / 4), // Increase the size of the custom shape circle by 10%
        painter: _CustomShapePainter(), // Custom shape painter
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background, // Set the background color here
      body: Stack(
        children: [
          Positioned(
            top: -0.350 * MediaQuery.of(context).size.width, // Position the circle such that its center aligns with the top-right corner of the screen
            right: -0.250 * MediaQuery.of(context).size.width, // Position the circle such that its center aligns with the top-right corner of the screen
            child: Container(
              width: 0.75 * MediaQuery.of(context).size.width, // Set the width to be 75% of the screen width
              height: 0.75 * MediaQuery.of(context).size.width, // Set the height to be 75% of the screen width
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          if (!_showNavigation) ...[ // Add this line
            Positioned(
              top: 0.12 * MediaQuery.of(context).size.height, // Move the custom shape slightly lower
              right: 0, // Move the custom shape to the right edge of the screen
              child: _customCircleAnimation,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Align all widgets to the center
                children: [
                  UserInfoWidget(user: widget.user), // Add the UserInfoWidget at the top immediately after the AppBar
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
                  setState(() {
                    _showNavigation = true; // Add this line
                  });
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
          ] else ...[ // Add this line
            NavigationMenu(),
          ],
        ],
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
