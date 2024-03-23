// File: image_service.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: Service for fetching image URLs

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> fetchImageUrls() async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('placeholder_food_images').get();
  return snapshot.docs.map((doc) => doc['url'] as String).toList();
}
