// File: user_preferences_service.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file defines the UserPreferencesService class.

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Import firebase_storage package
import '../models/user_preferences_model.dart';

class UserPreferencesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance; // Add this line

  Future<void> storeUserPreferences(UserPreferences userPreferences) async {
  String profileImageUrl = '';
  try {
    if (userPreferences.profileImage != null) {
      final Reference ref = _storage.ref().child('profileImages').child('${userPreferences.username}.jpg');
      final UploadTask uploadTask = ref.putFile(File(userPreferences.profileImage!)); // Convert String to File
      final TaskSnapshot downloadUrl = (await uploadTask);
      profileImageUrl = (await downloadUrl.ref.getDownloadURL());
    }

    await _firestore.collection('userPreferences').doc(userPreferences.username).set({
      'profileImage': profileImageUrl, // Store the URL of the uploaded image
        'username': userPreferences.username,
        'name': userPreferences.name,
        'emailAddress': userPreferences.emailAddress,
        'phoneNumber': userPreferences.phoneNumber,
        'birthday': userPreferences.birthday,
        'dietaryPreferences': userPreferences.dietaryPreferences,
        'cuisinePreferences': userPreferences.cuisinePreferences,
        'deliveryFrequency': userPreferences.deliveryFrequency,
        'timeOfDay': userPreferences.timeOfDay,
        'orderSize': userPreferences.orderSize,
        'deliveryInstructions': userPreferences.deliveryInstructions,
        'paymentMethod': userPreferences.paymentMethod,
        'savePaymentInfo': userPreferences.savePaymentInfo,
        'foodAllergies': userPreferences.foodAllergies,
        'spiceLevel': userPreferences.spiceLevel,
        'dishPreferences': userPreferences.dishPreferences,
        'supportEcoFriendlyRestaurants': userPreferences.supportEcoFriendlyRestaurants,
        'supportCommunityRestaurants': userPreferences.supportCommunityRestaurants,
        'theme': userPreferences.theme,
        'language': userPreferences.language,
        'pushNotifications': userPreferences.pushNotifications,
        'emailNotifications': userPreferences.emailNotifications,
        'orderHistoryVisibility': userPreferences.orderHistoryVisibility,
        'socialMediaIntegration': userPreferences.socialMediaIntegration,
        'marketingPreferences': userPreferences.marketingPreferences,
        'appVersion': userPreferences.appVersion,
        'privacySettings': userPreferences.privacySettings,
        'portionSize': userPreferences.portionSize, // New field
        'studentDeals': userPreferences.studentDeals, // New field
        'supportLocal': userPreferences.supportLocal, // New field
        'lateNightDelivery': userPreferences.lateNightDelivery, // New field
        'affordabilityFilters': userPreferences.affordabilityFilters, // New field
        'campusPartnerships': userPreferences.campusPartnerships, // New field
      });
    } catch (e) {
      print('Error occurred while storing user preferences: $e');
      throw e;
    }
  }
}
