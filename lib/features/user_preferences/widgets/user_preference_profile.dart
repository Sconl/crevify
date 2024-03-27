// File: user_preference_profile.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the UserPreferenceProfile widget.
// Date: Monday, 25 March 2024

import 'dart:io'; // Import dart:io to use the File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package
import 'package:flutter/services.dart'; // Import services for TextInputFormatter
import '../../../shared/theme/custom_theme.dart'; // Import custom theme

class UserPreferenceProfile extends StatefulWidget {
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  UserPreferenceProfile(this.selectedPreferences, this.togglePreference);

  @override
  _UserPreferenceProfileState createState() => _UserPreferenceProfileState();
}

class _UserPreferenceProfileState extends State<UserPreferenceProfile> {
  late TextEditingController _usernameController;
  late TextEditingController _phoneNumberController;
  late DateTime _selectedDate;
  File? _imageFile; // Change this to File?

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    try {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    } catch (e) {
      print('Error occurred while picking date: $e');
    }
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery); // Use pickImage instead of getImage
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path); // Convert XFile to File
        });
      }
    } catch (e) {
      print('Error occurred while picking image: $e');
    }
  }

  void _deleteImage() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // 90% of the container width
        child: Column(
          children: [
            SizedBox(height: 8.0), // 8 points spacing
            Text(
              'Account & Profile',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24), // Increase font size
              textAlign: TextAlign.center, // Align text to the center
            ),
            SizedBox(height: 8.0), // 8 points spacing
            Text(
              'Profile Pic (Show Us Your Yum)',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).primaryColor, fontSize: 12), // Reduce font size and set color to primary color
              textAlign: TextAlign.center, // Align text to the center
            ),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 36, // Increase the circle size by 20%
                backgroundColor: Colors.grey[200],
                child: _imageFile == null
                    ? Icon(Icons.add_a_photo, color: Colors.grey[800], size: 18) // Reduce the size of the icon
                    : null,
                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
              ),
            ),
            TextButton.icon(
              onPressed: _deleteImage,
              icon: Icon(Icons.delete, size: 18), // Reduce the size of the icon
              label: Text('Ditch the Pic (For Now)'),
            ),
            SizedBox(height: 5), // Reduce some space
            Text(
              'Username (Let\'s Get Creative)',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).primaryColor, fontSize: 12), // Reduce font size and set color to primary color
              textAlign: TextAlign.center, // Align text to the center
            ),
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.5), // Add a fill with 50% opacity
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)), // Completely rounded edges on the left and right side
                    borderSide: BorderSide.none, // Remove the bottom stroke
                  ),
                  prefixIcon: Icon(Icons.person, size: 18), // Reduce the size of the icon
                ),
              ),
            ),
            SizedBox(height: 5), // Reduce some space
            Text(
              'Phone Number (Seamless Payments & Payouts)',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).primaryColor, fontSize: 12), // Reduce font size and set color to primary color
              textAlign: TextAlign.center, // Align text to the center
            ),
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.5), // Add a fill with 50% opacity
              child: TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)), // Completely rounded edges on the left and right side
                    borderSide: BorderSide.none, // Remove the bottom stroke
                  ),
                  prefixIcon: Icon(Icons.phone, size: 18), // Reduce the size of the icon
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only digits can be entered
              ),
            ),
            SizedBox(height: 5), // Reduce some space
            Text(
              'Birthday (Treats on Us, Promise...)',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).primaryColor, fontSize: 12), // Reduce font size and set color to primary color
              textAlign: TextAlign.center, // Align text to the center
            ),
            TextButton(
              onPressed: _pickDate,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align items to the center
                children: [
                  Icon(Icons.calendar_today, size: 18), // Reduce the size of the icon
                  SizedBox(width: 8), // Add some space between the icon and the text
                  Flexible(child: Text('Select Birthday')), // Wrap the text
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
