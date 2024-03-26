// File: user_preferences_buttons.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: User preferences buttons

import 'package:flutter/material.dart';

class UserPreferencesButtons extends StatelessWidget {
  final int _currentStep;
  final Function _savePreferences;

  UserPreferencesButtons(this._currentStep, this._savePreferences);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30), // Add some spacing between the timeline and the buttons
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75, // 70% of the device width
          child: Opacity(
            opacity: _currentStep >= 2 ? 1.0 : 0.3, // The button is 50% opaque when _currentStep is less than 2
            child: ElevatedButton(
              onPressed: _currentStep >= 2 ? () => _savePreferences() : null, // The button is inactive until _currentStep is 2 or greater
              child: Text('Save Preferences', style: TextStyle(color: Colors.white)), // White label
              style: Theme.of(context).elevatedButtonTheme.style, // Get styling from custom_theme.dart
            ),
          ),
        ),
        SizedBox(height: 10), // Add some spacing between the buttons
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75, // 70% of the device width
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/learn_more');
            },
            child: Text('Stash this for Later'),
            style: Theme.of(context).outlinedButtonTheme.style, // Get styling from custom_theme.dart
          ),
        ),
      ],
    );
  }
}
