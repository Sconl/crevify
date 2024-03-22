import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shape_clipper/s_clipper.dart'; // Import the SClipper
import '../../../shared/widgets/appbar/custom_appbar.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 150, // Adjust the height as needed
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
