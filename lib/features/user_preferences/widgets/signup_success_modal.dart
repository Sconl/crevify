// File: signup_success_modal.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: A success modal for signup

import 'package:flutter/material.dart';

class SignupSuccessModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Success'),
      content: Text('You have successfully signed up!'),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
