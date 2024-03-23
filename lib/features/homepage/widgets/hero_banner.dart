// File: hero_banner.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: Hero Banner Widget for the homepage of the crevify app

import 'package:flutter/material.dart';
import '../services/image_service.dart'; // Import image_service.dart

class HeroBanner extends StatelessWidget {
  final Future<List<String>> images;

  // List of local images to be used when network images fail to load
  final List<String> localImages = [
    'assets/images/img_1_h.webp',
    'assets/images/img_3_h.webp',
    'assets/images/img_5_h.webp',
    'assets/images/img_7_h.webp',
    'assets/images/img_9_h.webp',
  ];

  HeroBanner({required this.images});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: images,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            width: MediaQuery.of(context).size.width * 0.88, // Set width to 90% of device width
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            child: ClipRRect( // Clip child widget to match parent's borderRadius
              borderRadius: BorderRadius.circular(30),
              child: PageView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Stack( // Stack to overlay an animated gradient
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        snapshot.data![index],
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          // Load a local image when the network image fails to load
                          return Image.asset(localImages[index % localImages.length]);
                        },
                      ),
                      AnimatedContainer( // Animated gradient overlay
                        duration: Duration(seconds: 2),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withOpacity(0.2)],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
