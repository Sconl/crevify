// File: onboarding_dietary_delivery.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the OnboardingDietaryDelivery widget.

import 'package:flutter/material.dart';
import '../../../shared/theme/custom_theme.dart'; // Import custom theme

class OnboardingDietaryDelivery extends StatelessWidget {
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  OnboardingDietaryDelivery(this.selectedPreferences, this.togglePreference);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Preferences',
          style: MyTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          'Dietary Preferences: (Refer to previous list for details)',
          style: MyTheme.lightTheme.textTheme.bodyLarge,
        ),
        // Add other fields here...
      ],
    );
  }
}
