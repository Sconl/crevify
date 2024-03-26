// File: user_preferences_screen.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: User preferences screen

//import 'package:crevify/shared/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/user_preferences_service.dart';
import '../models/user_preferences_model.dart';
import 'user_preferences_timeline.dart';
import 'user_preferences_buttons.dart';
import '../widgets/signup_success_modal.dart'; // Import the modal

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
      showDialog(
        context: context,
        builder: (context) => SignupSuccessModal(), // Display the modal
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0.07 * MediaQuery.of(context).size.height, // 7% distance from the top edge of the screen
              left: 0.02 * MediaQuery.of(context).size.width, // 2% distance from the left edge of the screen
              child: Container(
                width: 0.45 * 0.65 * MediaQuery.of(context).size.width, // 45% of the current size
                height: 0.45 * 0.65 * MediaQuery.of(context).size.width, // 45% of the current size
                child: Image.asset(
                  'assets/logos/crevify_iconmark_mini.webp',
                  height: 85,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17 + 10), // 18% distance from the top edge of the screen + 10 units
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                  children: [
                    SizedBox(height: 18), // Add space between logo and title
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03), // 10% distance from the left edge of the screen
                      child: Text(
                        'Your Flavor Profile',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(height: 10), // Add some spacing between the texts
                    UserPreferencesTimeline(_selectedPreferences, _togglePreference, _savePreferences),
                    UserPreferencesButtons(_currentStep, _savePreferences),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
