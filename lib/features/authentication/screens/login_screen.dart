// File: login_screen.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: login screen for crevify app

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:custom_appbar/custom_appbar.dart'; // Import custom_appbar package
import 'package:crevify/shared/theme/custom_theme.dart'; // Import your theme.dart file
import 'package:crevify/features/homepage/screens/homepage.dart'; // Import HomePage widget

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
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // Check if user is not null
        if (userCredential.user != null) {
          // Navigate to HomePage
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(user: userCredential.user!)));
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to sign in. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
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

  Future<User?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    // Check if user is not null
    if (userCredential.user != null) {
      // Navigate to HomePage
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(user: userCredential.user!)));
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in with Google. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
    return userCredential.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 75, // Adjust height as needed
        title: 'Suit Up!', // Just the string
        leadingWidgets: [],
        trailingWidgets: [],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0), // 80% of screen width
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/logos/crevify_iconmark_main.webp'),
                ),
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 15),
                Text(
                  'Ready to dive back into your journey? Let\'s get started!',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  height: 60, // Increased height by 20%
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Added left and right margins
                  child: TextFormField(
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
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      filled: true,
                      fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0), // Completely rounded edges
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 15), // Increased space by 70%
                Container(
                  height: 60, // Increased height by 20%
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Added left and right margins
                  child: TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'Password must be at least 8 characters long.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0), // Completely rounded edges
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                  child: ElevatedButton(
                    onPressed: _trySubmit,
                    child: Text('Login', style: TextStyle(color: Colors.white)), // White label
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                  child: OutlinedButton(
                    onPressed: _signInWithGoogle,
                    child: Text('Sign in with Google'),
                  ),
                ),
                SizedBox(height: 4), // Reduced space by 50%
                TextButton(
                  onPressed: () {
                    if (_email.isNotEmpty) {
                      _auth.sendPasswordResetEmail(email: _email);
                    }
                  },
                  child: Text('Forgot password?', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0)), // Not bold and slightly smaller font size
                ),
                SizedBox(height: 0), // Reduced space by 50%
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/signup'),
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0), // Primary color and slightly larger font size
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary, fontSize: 16.0), // Bold, secondary color and slightly larger font size
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 42, // Increased size by 20%
                    child: Opacity(
                      opacity: 0.5, // Increased opacity to 50%
                      child: SvgPicture.asset(
                        'assets/logos/ace_white.svg',
                        color: Theme.of(context).primaryColor, // Primary color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
