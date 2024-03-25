// File: user_preferences_service.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file defines the UserPreferencesService class.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_preferences_model.dart';

class UserPreferencesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeUserPreferences(UserPreferences userPreferences) async {
    await _firestore.collection('userPreferences').doc(userPreferences.username).set({
      'profileImage': userPreferences.profileImage,
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
    });
  }
}
