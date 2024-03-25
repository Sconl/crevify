// File: onboarding_preferences_finalize.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the OnboardingPreferencesFinalize widget.

import 'package:flutter/material.dart';
import '../../../shared/theme/custom_theme.dart'; // Import custom theme

class OnboardingPreferencesFinalize extends StatelessWidget {
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  OnboardingPreferencesFinalize(this.selectedPreferences, this.togglePreference);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Personalization',
          style: MyTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          'Theme: Allow users to choose a light or dark theme for the app interface.',
          style: MyTheme.lightTheme.textTheme.bodyLarge,
        ),
        // Add other fields here...
      ],
    );
  }
}
