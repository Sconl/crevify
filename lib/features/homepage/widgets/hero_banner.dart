// File: hero_banner.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: Hero Banner Widget for the homepage of the crevify app

import 'package:flutter/material.dart';
import '../services/image_service.dart'; // Import image_service.dart

class HeroBanner extends StatefulWidget {
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
  _HeroBannerState createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Change the slide every 2 seconds
    Future.delayed(Duration(seconds: 2)).then((_) {
      _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: widget.images,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            width: MediaQuery.of(context).size.width * 0.9, // Set width to 90% of device width
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // More rounded corners
            ),
            child: ClipRRect( // Clip child widget to match parent's borderRadius
              borderRadius: BorderRadius.circular(20),
              child: PageView.builder(
                controller: _pageController,
                itemCount: snapshot.data!.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                  // Change the slide every 2 seconds
                  Future.delayed(Duration(seconds: 2)).then((_) {
                    _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
                  });
                },
                itemBuilder: (context, index) {
                  return FittedBox( // Make the image fill the container
                    fit: BoxFit.cover,
                    child: Image.network(
                      snapshot.data![index],
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        // Load a local image when the network image fails to load
                        return Image.asset(widget.localImages[index % widget.localImages.length]);
                      },
                    ),
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
