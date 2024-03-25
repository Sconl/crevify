// File: onboarding_welcome_details.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the OnboardingWelcomeDetails widget.

import 'package:flutter/material.dart';
import '../../../shared/theme/custom_theme.dart'; // Import custom theme

class OnboardingWelcomeDetails extends StatelessWidget {
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  OnboardingWelcomeDetails(this.selectedPreferences, this.togglePreference);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Account & Profile',
          style: MyTheme.lightTheme.textTheme.headlineLarge,
        ),
        Text(
          'Profile Image: Allow users to upload a profile picture.',
          style: MyTheme.lightTheme.textTheme.bodyLarge,
        ),
        // Add other fields here...
      ],
    );
  }
}
