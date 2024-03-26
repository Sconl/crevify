// File: onboarding_welcome_details.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the OnboardingWelcomeDetails widget.

import 'dart:io'; // Import dart:io to use the File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package
import '../../../shared/theme/custom_theme.dart'; // Import custom theme

class OnboardingWelcomeDetails extends StatefulWidget {
  final List<String> selectedPreferences;
  final Function(String) togglePreference;

  OnboardingWelcomeDetails(this.selectedPreferences, this.togglePreference);

  @override
  _OnboardingWelcomeDetailsState createState() => _OnboardingWelcomeDetailsState();
}

class _OnboardingWelcomeDetailsState extends State<OnboardingWelcomeDetails> {
  late TextEditingController _usernameController;
  late TextEditingController _phoneNumberController;
  late DateTime _selectedDate;
  late File _imageFile; // Change this to File

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.5), // Background color with 50% opacity
      child: Column(
        children: [
          Text(
            'Account & Profile',
            style: MyTheme.lightTheme.textTheme.headlineLarge,
          ),
          TextButton(
            onPressed: _pickImage,
            child: Text('Upload Profile Image'),
          ),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
            ),
          ),
          TextButton(
            onPressed: _pickDate,
            child: Text('Select Birthday'),
          ),
          TextButton(
            onPressed: () {
              // Call your method to store preferences here
              // You will need to pass the username, phone number, birthday, and image file
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
