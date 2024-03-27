// File: user_preferences_timeline.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: User preferences timeline
// Date: Monday, 25 March 2024

import 'package:flutter/material.dart';
import 'user_preference_profile.dart';
import 'user_preference_dietary.dart';
import 'user_preference_final.dart';

class UserPreferencesTimeline extends StatefulWidget {
  final List<String> _selectedPreferences;
  final Function(String) _togglePreference;
  final Function _savePreferences;

  UserPreferencesTimeline(this._selectedPreferences, this._togglePreference, this._savePreferences);

  @override
  _UserPreferencesTimelineState createState() => _UserPreferencesTimelineState();
}

class _UserPreferencesTimelineState extends State<UserPreferencesTimeline> {
  int _currentStep = 0;

  void _togglePreference(String preference) {
    setState(() {
      if (widget._selectedPreferences.contains(preference)) {
        // If the preference is already selected, remove it
        widget._selectedPreferences.remove(preference);
      } else {
        // If the preference is not selected, add it
        widget._selectedPreferences.add(preference);
      }
    });
  }

  void _nextStep() {
    setState(() {
      _currentStep += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        if (_currentStep >= 0)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: UserPreferenceProfile(
              widget._selectedPreferences,
              widget._togglePreference,
            ),
          ),
        if (_currentStep >= 1)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: UserPreferenceDietary(
              widget._selectedPreferences,
              widget._togglePreference,
            ),
          ),
        if (_currentStep >= 2)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: UserPreferenceFinal(
              widget._selectedPreferences,
              widget._togglePreference,
            ),
          ),
        ElevatedButton(
          onPressed: _nextStep,
          child: Text('Next'),
        ),
      ],
    );
  }
}
