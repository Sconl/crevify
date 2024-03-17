import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crevify/shared/theme/theme.dart'; // Import your theme.dart file

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key to identify our form
  final _auth = FirebaseAuth.instance; // Firebase authentication instance
  String _email = ''; // Variable to store email
  String _password = ''; // Variable to store password

  // Function to validate and save form
  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate(); // Validate form fields
    FocusScope.of(context).unfocus(); // Close keyboard

    if (isValid) {
      _formKey.currentState!.save(); // Save form fields
      try {
        await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // Navigate to another screen
      } on FirebaseAuthException catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: ValueKey('email'),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address.';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
              decoration: InputDecoration(labelText: 'Email address'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              key: ValueKey('password'),
              validator: (value) {
                if (value!.isEmpty || value.length < 7) {
                  return 'Password must be at least 7 characters long.';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 12),
            ElevatedButton(
  onPressed: _trySubmit,
  child: Text('Login', style: Theme.of(context).textTheme.button),
  style: ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
),


          ],
        ),
      ),
    );
  }
}
