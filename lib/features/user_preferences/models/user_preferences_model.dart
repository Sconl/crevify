// File: user_preferences_model.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file defines the UserPreferences model.

class UserPreferences {
  String? profileImage;
  String? username;
  String? name;
  String? emailAddress;
  String? phoneNumber;
  DateTime? birthday;
  List<String>? dietaryPreferences;
  List<String>? cuisinePreferences;
  String? deliveryFrequency;
  String? timeOfDay;
  String? orderSize;
  String? deliveryInstructions;
  String? paymentMethod;
  bool savePaymentInfo;
  List<String>? foodAllergies;
  String? spiceLevel;
  List<String>? dishPreferences;
  bool supportEcoFriendlyRestaurants;
  bool supportCommunityRestaurants;
  String? theme;
  String? language;
  bool pushNotifications;
  bool emailNotifications;
  bool orderHistoryVisibility;
  bool socialMediaIntegration;
  bool marketingPreferences;
  String? appVersion;
  bool privacySettings;

  UserPreferences({
    this.profileImage,
    this.username,
    this.name,
    this.emailAddress,
    this.phoneNumber,
    this.birthday,
    this.dietaryPreferences,
    this.cuisinePreferences,
    this.deliveryFrequency,
    this.timeOfDay,
    this.orderSize,
    this.deliveryInstructions,
    this.paymentMethod,
    this.savePaymentInfo = false,
    this.foodAllergies,
    this.spiceLevel,
    this.dishPreferences,
    this.supportEcoFriendlyRestaurants = false,
    this.supportCommunityRestaurants = false,
    this.theme,
    this.language,
    this.pushNotifications = true,
    this.emailNotifications = true,
    this.orderHistoryVisibility = true,
    this.socialMediaIntegration = false,
    this.marketingPreferences = true,
    this.appVersion,
    this.privacySettings = true,
  });
}
