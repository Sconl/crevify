// File: home_page.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: homescreen for crevify app

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:custom_appbar/custom_appbar.dart'; // Import custom app bar package

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 80, // Adjust the height as needed
        title: 'Home Page',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }
}
