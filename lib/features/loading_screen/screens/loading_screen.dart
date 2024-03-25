// File: loading_screen.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the LoadingScreen widget which displays a loading spinner while a Future is in progress.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import AnimatedTextKit
import '../../splash_screen/bloc/splash_bloc/splash_bloc.dart'; // Import SplashBloc
import '../../../shared/theme/custom_theme.dart'; // Import App
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:crevify/features/homepage/screens/homepage.dart'; // Import HomePage

class LoadingScreen extends StatefulWidget {
  final SplashBloc splashBloc;
  final Future future;

  const LoadingScreen({Key? key, required this.splashBloc, required this.future})
      : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2), // Make the animation slower
      vsync: this,
    );
    Future.wait([
      widget.future,
      Future.delayed(Duration(seconds: 5)),
    ]).then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(user: FirebaseAuth.instance.currentUser!),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.platformBrightnessOf(context) == Brightness.dark ? MyTheme.darkTheme : MyTheme.lightTheme;
    return Scaffold(
      backgroundColor: theme.colorScheme.background, // Set background based on theme
      body: Stack( // Use Stack to overlay widgets
        alignment: Alignment.center, // Center the children of the Stack
        children: [
          Positioned( // Positioned widget for progress indicator
            top: MediaQuery.of(context).size.height * 0.85, // Position it 85% from the top of the screen
            child: Center( // Wrap with Center
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7, // Provide a width to the Container
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15), // Add horizontal padding to make the LinearProgressIndicator span 70% of the device screen width
                  child: ClipRRect( // Use ClipRRect to make the ends of the LinearProgressIndicator rounded
                    borderRadius: BorderRadius.circular(10.0),
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) => LinearProgressIndicator(
                        backgroundColor: theme.primaryColor.withOpacity(0.05), // Reduce the opacity to 5%
                        valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor.withOpacity(0.25)), // Reduce the opacity of the value color to 25%
                        value: controller.value, // Use the controller's value to control the LinearProgressIndicator
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned( // Positioned widget for TypewriterAnimatedTextKit
            top: MediaQuery.of(context).size.height * 0.7, // Position it 70% from the top of the screen
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7, // Set width to 70% of the device screen
              child: Center(
                child: TypewriterAnimatedTextKit(
                  textAlign: TextAlign.center, // Align the text to the center
                  text: [
                    'loading faster than a delivery drone!',
                    'Shhh... we\'re crafting your culinary masterpiece. Patience is delicious!',
                    'Gathering flavors from hidden gems... your taste buds will do a happy dance!',
                    'Need a sign? This is it. Your next feast awaits.',
                    'Hangry monsters attacking? We\'ve got reinforcements... ETA: loading!',
                    'Don\'t worry, be happy... and hungry! Feast incoming in...',
                    'Tech & tastebuds working overtime. Your food coma is on the horizon.',
                    'Hold onto your forks! Flavor explosion incoming in... 3, 2, 1...',
                    'From app to doorstep, your next bite is on the move. Buckle up!',
                    'Patience is a virtue, especially when deliciousness is this close!'
                  ],
                  textStyle: TextStyle(
                    fontSize: 12.0, // Make the text small in size
                    color: theme.primaryColor, // Set the font color to the primary color of the theme
                    fontFamily: 'Popins',
                  ),
                  speed: Duration(milliseconds: 100), // Adjust this value to make the typing effect faster
                  pause: Duration(seconds: 3), // Add a pause before the animation starts
                ),
              ),
            ),
          ),
          Center( // Wrap with Center
            child: SizedBox( // The Rive animation
              width: MediaQuery.of(context).size.width * 0.7, // Set width to 70% of the device screen
              child: RiveAnimation.asset(
                'assets/rive_animations/crevify_logo_intro.riv',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
