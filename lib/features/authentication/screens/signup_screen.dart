// File: signup_screen.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: sign up screen for crevify app

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:custom_appbar/custom_appbar.dart'; // Import custom_appbar package
//import 'package:crevify/shared/theme/custom_theme.dart'; // Import your theme.dart file
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crevify/features/loading_screen/screens/loading_screen.dart'; // Import LoadingScreen widget
import '../../splash_screen/bloc/splash_bloc/splash_bloc.dart'; // Import SplashBloc

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // Key to identify our form
  final _auth = FirebaseAuth.instance; // Firebase authentication instance
  String _firstName = ''; // Variable to store first name
  String _lastName = ''; // Variable to store last name
  String _email = ''; // Variable to store email
  String _password = ''; // Variable to store password
  final SplashBloc _splashBloc = SplashBloc(); // Initialize SplashBloc here

  // Function to validate and save form
  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate(); // Validate form fields
    FocusScope.of(context).unfocus(); // Close keyboard

    if (isValid) {
      _formKey.currentState!.save(); // Save form fields
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // Update user information
        await userCredential.user!.updateDisplayName('$_firstName $_lastName');

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoadingScreen(
              future: Future.value(userCredential),
              splashBloc: _splashBloc,
            ),
          ),
        );
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

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoadingScreen(
          future: FirebaseAuth.instance.signInWithCredential(credential),
          splashBloc: _splashBloc,
        ),
      ),
    );

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        height: 75, // Adjust height as needed
        title: 'Power Up!', // Changed the string
        leadingWidgets: [],
        trailingWidgets: [],
      ),
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05), // 80% of screen width
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/logos/crevify_iconmark_main.webp'),
                ),
                Text(
                  'Join the Party!', // Changed the string
                  style: theme.textTheme.headlineLarge!.copyWith(color: theme.colorScheme.onBackground), // Updated color to match the theme
                ),
                SizedBox(height: 15),
                Text(
                  'Ready to start your journey? Let\'s get started!',
                  style: theme.textTheme.bodyText1!.copyWith(color: theme.colorScheme.onBackground, fontSize: 12), // Updated color to match the theme
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          key: ValueKey('firstName'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _firstName = value!;
                          },
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            filled: true,
                            fillColor: theme.primaryColor.withOpacity(0.25),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          key: ValueKey('lastName'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _lastName = value!;
                          },
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            filled: true,
                            fillColor: theme.primaryColor.withOpacity(0.25),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 50,
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
                      fillColor: theme.primaryColor.withOpacity(0.25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 50,
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
                      fillColor: theme.primaryColor.withOpacity(0.25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: _trySubmit,
                    child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: OutlinedButton(
                    onPressed: _signInWithGoogle,
                    child: Text('Sign up with Google'),
                  ),
                ),
                SizedBox(height: 4),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/login'),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: theme.primaryColor, fontSize: 16.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(fontWeight: FontWeight.bold, color: theme.colorScheme.secondary, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 42,
                    child: Opacity(
                      opacity: 0.5,
                      child: SvgPicture.asset(
                        'assets/logos/ace_white.svg',
                        color: theme.primaryColor,
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
