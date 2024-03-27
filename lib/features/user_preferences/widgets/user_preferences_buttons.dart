// File: user_preferences_buttons.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the UserPreferencesButtons widget.
// Date: Monday, 25 March 2024

import 'package:flutter/material.dart';

class UserPreferencesButtons extends StatelessWidget {
  final int currentStep;
  final Function savePreferences;

  UserPreferencesButtons(this.currentStep, this.savePreferences);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Align the buttons to the center
      children: [
        if (currentStep > 0) // Only show the 'Back' button if the current step is greater than 0
          ElevatedButton(
            onPressed: () {
              // Implement your logic for going back to the previous step
            },
            child: Text('Back'),
          ),
        SizedBox(width: 8.0), // Add some space between the 'Back' and 'Next' buttons
        ElevatedButton(
          onPressed: () {
            // Call the savePreferences function when the 'Next' button is pressed
            savePreferences();
          },
          child: Text('Next'),
        ),
      ],
    );
  }
}
