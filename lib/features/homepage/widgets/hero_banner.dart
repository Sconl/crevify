// File: hero_banner.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: Hero Banner Widget for the homepage of the crevify app

import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  final Future<List<String>> images;

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
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  snapshot.data![index],
                  fit: BoxFit.cover,
                );
              },
            ),
          );
        }
      },
    );
  }
}
