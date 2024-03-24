// File: user_info_widget.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: A widget to display user info and a search bar

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class UserInfoWidget extends StatelessWidget {
  final User user;

  const UserInfoWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Placeholder profile image URLs
    final profileImages = [
      'assets/_profile_placeholders/boy-simple.png',
      'assets/_profile_placeholders/cyber-punk.png',
      'assets/_profile_placeholders/doctor-female.png',
      'assets/_profile_placeholders/doctor-male.png',
      'assets/_profile_placeholders/girl-african.png',
      'assets/_profile_placeholders/girl-happy.png',
      'assets/_profile_placeholders/girl-hoodie.png',
      'assets/_profile_placeholders/girl-pink.png',
      'assets/_profile_placeholders/graduate-male.png',
      'assets/_profile_placeholders/hacker-hoodie.png',
      'assets/_profile_placeholders/man-happy.png',
      'assets/_profile_placeholders/man-vintage.png',
      'assets/_profile_placeholders/woman-simle.png',
      'assets/_profile_placeholders/youth-male.png',
    ];

    // Placeholder search bar texts
    final searchBarTexts = [
      'Craving something specific?',
      'What are you in the mood for?',
      'Looking for your favorite dish?',
      'Hungry for something delicious?',
      'What can we find for you today?',
      'Feeling hungry? Search here!',
    ];

    // Select a random profile image and search bar text
    final randomProfileImage = profileImages[Random().nextInt(profileImages.length)];
    final randomSearchBarText = searchBarTexts[Random().nextInt(searchBarTexts.length)];

    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // The widget should span only 90% of the device screen width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align all elements to the left
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleAvatar(
              radius: 35, // Reduce the size of the profile image by about 15%
              backgroundImage: user.photoURL != null ? NetworkImage(user.photoURL!) as ImageProvider : AssetImage(randomProfileImage) as ImageProvider, // Use a random profile image from the assets folder if the user has not set a profile image
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Good ${TimeOfDay.now().period == DayPeriod.am ? 'morning' : 'afternoon'},', // Display a greeting message depending on the actual time of the day
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), // Make the greeting text larger
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              '${user.displayName?.split(' ')[0] ?? user.email}!', // Display the user's first name with an exclamation mark after it
              style: TextStyle(fontSize: 20), // Make the name slightly smaller
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none, // Remove the border
                fillColor: Theme.of(context).primaryColor.withOpacity(0.25), // Set the fill color to the primary color with 25% opacity
                filled: true,
                prefixIcon: Icon(Icons.search), // Add a magnifying glass icon inside the field
                hintText: randomSearchBarText, // Display a random placeholder text
                contentPadding: EdgeInsets.all(12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), // Completely rounded edges
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), // Completely rounded edges
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
