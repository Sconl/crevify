import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Object? error;

  ErrorScreen({this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('An error occurred: $error'),
      ),
    );
  }
}
