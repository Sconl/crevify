// File: user_preferences_screen.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: User preferences screen
// Date: Monday, 25 March 2024

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/user_preferences_service.dart';
import '../models/user_preferences_model.dart';
import '../widgets/user_preferences_buttons.dart';
import '../widgets/signup_success_modal.dart'; // Import the modal
import '../widgets/user_preferences_timeline.dart';

class UserPreferencesScreen extends StatefulWidget {
  final User user;

  UserPreferencesScreen({Key? key, required this.user}) : super(key: key);

  @override
  _UserPreferencesScreenState createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  List<String> _selectedPreferences = [];
  final UserPreferencesService _userPreferencesService =
      UserPreferencesService();
  int _currentStep = 0; // Add a state variable to keep track of the current step

  void _togglePreference(String preference) {
    setState(() {
      if (_selectedPreferences.contains(preference)) {
        _selectedPreferences.remove(preference);
      } else {
        _selectedPreferences.add(preference);
      }
    });
  }

  void _savePreferences() {
    UserPreferences userPreferences = UserPreferences(
      username: widget.user.uid,
      dietaryPreferences: _selectedPreferences,
      spiceLevel: 'Not Spicy',
      portionSize: 'Standard',
      studentDeals: false,
      supportLocal: false,
      lateNightDelivery: false,
      affordabilityFilters: false,
      campusPartnerships: false,
    );

    _userPreferencesService.storeUserPreferences(userPreferences);
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) { // Check if the widget is still in the tree
        showDialog(
          context: context,
          builder: (context) => SignupSuccessModal(), // Display the modal
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0, // 16 points padding on the left
            right: 16.0, // 16 points padding on the right
            top: 24.0, // 24 points padding on the top
            bottom: 24.0, // 24 points padding on the bottom
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0), // 2 units of 8 points each
              Image.asset(
                'assets/logos/crevify_iconmark_mini.webp',
                height: MediaQuery.of(context).size.height * 0.20, // 20% of the screen height
              ),
              SizedBox(height: 16.0), // 2 units of 8 points each
              Text(
                'Your Flavor Profile',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 16.0), // 2 units of 8 points each
              Text(
                'Placeholder Subhead Copy',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 16.0), // 2 units of 8 points each
              Container(
                height: 200, // Set a fixed height for the ListView
                child: UserPreferencesTimeline(_selectedPreferences, _togglePreference, _savePreferences),
              ),
              SizedBox(height: 16.0), // 2 units of 8 points each
              UserPreferencesButtons(_currentStep, _savePreferences),
            ],
          ),
        ),
      ),
    );
  }
}
