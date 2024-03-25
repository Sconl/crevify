// File: user_preferences.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the User Preferences screen.

import 'package:flutter/material.dart';
// Import custom_appbar package
import 'package:timeline_tile/timeline_tile.dart'; // Import timeline_tile package
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth package
// Import your theme.dart file
import '../../homepage/widgets/navigation.dart'; // Corrected import for NavigationMenu
import '../services/user_preferences_service.dart'; // Import UserPreferencesService
import '../models/user_preferences_model.dart'; // Import UserPreferences model

class UserPreferencesScreen extends StatefulWidget {
  final User user;

  UserPreferencesScreen({Key? key, required this.user}) : super(key: key);

  @override
  _UserPreferencesScreenState createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  bool _showNavigation = false;
  List<String> _selectedPreferences = [];
  final UserPreferencesService _userPreferencesService = UserPreferencesService();

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
    );

    _userPreferencesService.storeUserPreferences(userPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            top: -0.350 * MediaQuery.of(context).size.width,
            right: -0.250 * MediaQuery.of(context).size.width,
            child: Container(
              width: 0.75 * MediaQuery.of(context).size.width,
              height: 0.75 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          if (!_showNavigation) ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Timeline Step 1
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Colors.purple,
                      padding: EdgeInsets.all(8),
                    ),
                    endChild: _Child(
                      'Step 1',
                      _selectedPreferences,
                      _togglePreference,
                    ),
                  ),
                  // Timeline Step 2
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Colors.purple,
                      padding: EdgeInsets.all(8),
                    ),
                    endChild: _Child(
                      'Step 2',
                      _selectedPreferences,
                      _togglePreference,
                    ),
                  ),
                  // Timeline Step 3
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isLast: true,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Colors.purple,
                      padding: EdgeInsets.all(8),
                    ),
                    endChild: _Child(
                      'Step 3',
                      _selectedPreferences,
                      _togglePreference,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _savePreferences,
                    child: Text('Save Preferences'),
                  ),
                ],
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
    );
  }
}

class _Child extends StatelessWidget {
  const _Child(
    this.text,
    this.selectedPreferences,
    this.togglePreference, {
    Key key = const Key(''),
  }) : super(key: key);

  final String text;
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CheckboxListTile(
        title: Text(text),
        value: selectedPreferences.contains(text),
        onChanged: (bool? value) {
          togglePreference(text);
        },
      ),
    );
  }
}
