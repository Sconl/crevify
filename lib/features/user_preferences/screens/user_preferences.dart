// File: user_preferences.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: User preferences screen

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../homepage/widgets/navigation.dart';
import '../services/user_preferences_service.dart';
import '../models/user_preferences_model.dart';
import '../widgets/onboarding_welcome_details.dart';
import '../widgets/onboarding_dietary_delivery.dart';
import '../widgets/onboarding_preferences_finalize.dart';
import '../widgets/signup_success_modal.dart'; // Import the modal
import '../../../shared/theme/custom_theme.dart';

class UserPreferencesScreen extends StatefulWidget {
  final User user;

  UserPreferencesScreen({Key? key, required this.user}) : super(key: key);

  @override
  _UserPreferencesScreenState createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  bool _showNavigation = false;
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => SignupSuccessModal(), // Display the modal
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark; // Check if dark mode is enabled
    final iconColor = isDarkMode ? lightBackgroundColor : darkBackgroundColor; // Set icon color based on theme

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.07 * MediaQuery.of(context).size.height, // 7% distance from the top edge of the screen
            left: 0.05 * MediaQuery.of(context).size.width, // 5% distance from the left edge of the screen
            child: Container(
              width: 0.45 * 0.75 * MediaQuery.of(context).size.width, // 45% of the current size
              height: 0.45 * 0.75 * MediaQuery.of(context).size.width, // 45% of the current size
              child: Image.asset(
                'assets/logos/crevify_iconmark_mini.webp',
                height: 90,
              ),
            ),
          ),
          if (!_showNavigation) ...[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.21), // 21% distance from the top edge of the screen
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                    children: [
                      SizedBox(height: 20), // Add space between logo and title
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.10), // 10% distance from the left edge of the screen
                        child: Text(
                          'Your Flavor Profile',
                          style: Theme.of(context).textTheme.headlineLarge, // Get styling from custom_theme.dart and reduce font size to 13
                        ),
                      ),
                      SizedBox(height: 10), // Add some spacing between the texts
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.10), // 10% distance from the left edge of the screen
                        child: Text(
                          'Let\'s Craft Your Food Adventure!',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 13), // Get styling from custom_theme.dart and reduce font size to 13
                        ),
                      ),
                      // Timeline Step 1
                      if (_currentStep >= 0) // Only show this tile if the current step is 0 or greater
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05), // 5% distance from the left edge of the screen
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90, // 90% of the device width
                            child: TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: true,
                              indicatorStyle: IndicatorStyle(width: 60 * 0.60, iconStyle: IconStyle(iconData: Icons.person, color: iconColor), color: Theme.of(context).primaryColor.withOpacity(0.3), padding: EdgeInsets.all(5)), // 40% smaller, primary color fill with 30% opacity, white icon
                              beforeLineStyle: LineStyle(color: Theme.of(context).primaryColor.withOpacity(0.3), thickness: 2), // Use primary color with 30% opacity for the line
                              endChild: Padding(
                                padding: EdgeInsets.all(8.0), // Add padding to the tile icon
                                child: OnboardingWelcomeDetails(
                                  _selectedPreferences,
                                  _togglePreference,
                                ),
                              ),
                            ),
                          ),
                        ),
                      // Timeline Step 2
                      if (_currentStep >= 1) // Only show this tile if the current step is 1 or greater
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05), // 5% distance from the left edge of the screen
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90, // 90% of the device width
                            child: TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              indicatorStyle: IndicatorStyle(width: 60 * 0.60, iconStyle: IconStyle(iconData: Icons.done, color: iconColor), color: Theme.of(context).primaryColor.withOpacity(0.3), padding: EdgeInsets.all(5)), // 40% smaller, primary color fill with 30% opacity, white icon
                              beforeLineStyle: LineStyle(color: Theme.of(context).primaryColor.withOpacity(0.3), thickness: 2), // Use primary color with 30% opacity for the line
                              endChild: Padding(
                                padding: EdgeInsets.all(8.0), // Add padding to the tile icon
                                child: OnboardingDietaryDelivery(
                                  _selectedPreferences,
                                  _togglePreference,
                                ),
                              ),
                            ),
                          ),
                        ),
                      // Timeline Step 3
                      if (_currentStep >= 2) // Only show this tile if the current step is 2 or greater
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05), // 5% distance from the left edge of the screen
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90, // 90% of the device width
                            child: TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isLast: true,
                              indicatorStyle: IndicatorStyle(width: 60 * 0.60, iconStyle: IconStyle(iconData: Icons.done, color: iconColor), color: Theme.of(context).primaryColor.withOpacity(0.3), padding: EdgeInsets.all(5)), // 40% smaller, primary color fill with 30% opacity, white icon
                              beforeLineStyle: LineStyle(color: Theme.of(context).primaryColor.withOpacity(0.3), thickness: 2), // Use primary color with 30% opacity for the line
                              endChild: Padding(
                                padding: EdgeInsets.all(8.0), // Add padding to the tile icon
                                child: OnboardingPreferencesFinalize(
                                  _selectedPreferences,
                                  _togglePreference,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40.0,
              right: 20.0,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    _showNavigation = true;
                  });
                },
              ),
            ),
          ] else ...[
            NavigationMenu(),
          ],
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum space vertically
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70, // 70% of the device width
              child: ElevatedButton(
                onPressed: _savePreferences,
                child: Text('Save Preferences', style: TextStyle(color: Colors.white)), // White label
                style: Theme.of(context).elevatedButtonTheme.style, // Get styling from custom_theme.dart
              ),
            ),
            SizedBox(height: 10), // Add some spacing between the buttons
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70, // 70%
                            child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/learn_more');
                },
                child: Text('Continue Later'),
                style: Theme.of(context).outlinedButtonTheme.style, // Get styling from custom_theme.dart
              ),
            ),
          ],
        ),
      ),
    );
  }
}
