// File: user_preference_dietary.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the UserPreferenceDietary widget.
// Date: Monday, 25 March 2024

import 'package:flutter/material.dart';

class UserPreferenceDietary extends StatelessWidget {
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  UserPreferenceDietary(this.selectedPreferences, this.togglePreference);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('User Preference Dietary'),
        // Add your widgets here...
      ],
    );
  }
}
