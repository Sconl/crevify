// File: user_preference_final.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the UserPreferenceFinal widget.
// Date: Monday, 25 March 2024

import 'package:flutter/material.dart';

class UserPreferenceFinal extends StatelessWidget {
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  UserPreferenceFinal(this.selectedPreferences, this.togglePreference);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('User Preference Final'),
        // Add your widgets here...
      ],
    );
  }
}
