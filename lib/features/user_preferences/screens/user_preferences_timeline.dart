// File: user_preferences_timeline.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: User preferences timeline

import 'package:crevify/shared/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../widgets/onboarding_welcome_details.dart';
//import '../widgets/onboarding_dietary_delivery.dart';
//import '../widgets/onboarding_preferences_finalize.dart';

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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark; // Check if dark mode is enabled
    final iconColor = isDarkMode ? lightBackgroundColor : darkBackgroundColor; // Set icon color based on theme
    
      return Column(
      children: [
        // Timeline Step 1
        if (_currentStep >= 0) // Only show this tile if the current step is 0 or greater
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.00), // 5% distance from the left edge of the screen
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.90, // 90% of the device width
              child: TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: true,
                indicatorStyle: IndicatorStyle(width: 60 * 0.60, iconStyle: IconStyle(iconData: Icons.done, color: iconColor), color: Theme.of(context).primaryColor.withOpacity(1), padding: EdgeInsets.all(10)), // 40% smaller, primary color fill with 30% opacity, white icon
                beforeLineStyle: LineStyle(color: Theme.of(context).primaryColor.withOpacity(0.5), thickness: 3), // Use primary color with 30% opacity for the line
                afterLineStyle: LineStyle(color: Theme.of(context).primaryColor.withOpacity(0.5), thickness: 3), // Use primary color with 30% opacity for the line
                endChild: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(0.2), // Set the fill of the tile to be the primary color at 20% opacity
                  child: Padding(
                    padding: EdgeInsets.all(10), // Add padding to the tile icon
                    child: Column(
                      children: [
                        OnboardingWelcomeDetails(
                          widget._selectedPreferences,
                          widget._togglePreference,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget._savePreferences();
                            setState(() {
                              _currentStep = 1;
                            });
                          },
                          child: Text('Next'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        // Rest of the code goes here...


      ],
    );
  }
}
