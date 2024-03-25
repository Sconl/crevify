// File: learn_more.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: This file contains the LearnMorePage widget which is a screen where users can learn more about the app.

import 'package:flutter/material.dart';

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn More'),
      ),
      body: Center(
        child: Text(
          'Learn More',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
