// File: navigation.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: Defines the navigation options for the app

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationMenu extends StatelessWidget {
  final List<String> placeholderCopies = [
    "May the food odds be ever in your favor. Order now!",
    "We'll deliver your feast faster than a droid can say 'beep boop'.",
    "Feeling like a superhero? Fuel your day with Crevify!",
    "This app is legen - wait for it - dary!",
    "Don't be a couch potato, get Crevify and explore new flavors!"
  ];

  @override
  Widget build(BuildContext context) {
    String placeholderCopy = placeholderCopies[Random().nextInt(placeholderCopies.length)]; // Randomly select a placeholder copy

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07, // 7% from the top edge
            left: MediaQuery.of(context).size.width * 0.05, // 5% from the left edge
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/home'); // Navigate to the homepage when logo is tapped
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01), // 1% from the left edge
                        child: Image.asset('assets/logos/crevify_iconmark_mini.webp', height: 135), // Logo with height set to 135 units
                      ),
                    ),
                    SizedBox(height: 10), // Reduced space between list items
                    ListTile(
                      leading: Icon(Icons.home, color: Theme.of(context).primaryColor), // Home icon with primary color
                      title: Text('Home'),
                      onTap: () {
                        Navigator.pushNamed(context, '/home'); // Navigate to the homepage
                      },
                    ),
                    SizedBox(height: 10), // Reduced space between list items
                    ListTile(
                      leading: Icon(Icons.shopping_bag, color: Theme.of(context).primaryColor), // Orders icon with primary color
                      title: Text('Orders'),
                      onTap: () {
                        Navigator.pushNamed(context, '/orders'); // Navigate to the orders page
                      },
                    ),
                    SizedBox(height: 10), // Reduced space between list items
                    ExpansionTile(
                      leading: Icon(Icons.explore, color: Theme.of(context).primaryColor), // Explore icon with primary color
                      title: Text('Explore'),
                      children: [
                        ListTile(
                          title: Text('Crevify Kitchen', style: TextStyle(color: Theme.of(context).primaryColor)), // Text with primary color
                          onTap: () {
                            Navigator.pushNamed(context, '/crevify-kitchen'); // Navigate to the Crevify Kitchen page
                          },
                        ),
                        ListTile(
                          title: Text('Fuel Your Hustle', style: TextStyle(color: Theme.of(context).primaryColor)), // Text with primary color
                          onTap: () {
                            Navigator.pushNamed(context, '/fuel-your-hustle'); // Navigate to the Fuel Your Hustle page
                          },
                        ),
                        ListTile(
                          title: Text('Munchies Map', style: TextStyle(color: Theme.of(context).primaryColor)), // Text with primary color
                          onTap: () {
                            Navigator.pushNamed(context, '/munchies-map'); // Navigate to the Munchies Map page
                          },
                        ),
                        ListTile(
                          title: Text('Crevify Cares', style: TextStyle(color: Theme.of(context).primaryColor)), // Text with primary color
                          onTap: () {
                            Navigator.pushNamed(context, '/crevify-cares'); // Navigate to the Crevify Cares page
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Reduced space between list items
                    ListTile(
                      leading: Icon(Icons.loyalty, color: Theme.of(context).primaryColor), // Loyalty Program icon with primary color
                      title: Text('Loyalty Program'),
                      onTap: () {},
                    ),
                    SizedBox(height: 10), // Reduced space between list items
                    ListTile(
                      leading: Icon(Icons.info, color: Theme.of(context).primaryColor), // About Crevify icon with primary color
                      title: Text('About Crevify'),
                      onTap: () {
                        Navigator.pushNamed(context, '/about'); // Navigate to the About page
                      },
                    ),
                    SizedBox(height: 10), // Reduced space between list items
                    ListTile(
                      leading: Icon(Icons.settings, color: Theme.of(context).primaryColor), // Settings icon with primary color
                      title: Text('Settings'),
                      onTap: () {
                        Navigator.pushNamed(context, '/settings'); // Navigate to the Settings page
                      },
                    ),
                    // Removed the logout button from here
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05, // 5% from the top edge
            right: MediaQuery.of(context).size.width * 0.05, // 5% from the right edge
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white), // Close icon with white color
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home'); // Navigate to the homepage
              },
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.035, // 3.5% from the bottom edge
            child: Container(
              width: MediaQuery.of(context).size.width, // 100% of screen width
              child: Center(
                child: Text(placeholderCopy, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12)), // Placeholder copy with primary color and font size 12
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.07, // 10% from the bottom edge
            left: MediaQuery.of(context).size.width * 0.125, // Center of the screen width
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).primaryColor), // Border color with primary color
                ),
                child: Text('Logout', style: TextStyle(color: Theme.of(context).primaryColor)), // Text with primary color
                onPressed: () async {
                  await FirebaseAuth.instance.signOut(); // Sign out
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false); // Navigate to the login page and remove all previous routes
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
