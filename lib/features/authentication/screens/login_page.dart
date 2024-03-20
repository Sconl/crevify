import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/logos/crevify_logo_vertical_main.webp'),
                SizedBox(height: 20),
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Ready to dive back into your journey? Let\'s get started!',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 12),
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
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _signInWithGoogle,
                  child: Text('Sign in with Google', style: Theme.of(context).textTheme.button),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    if (_email.isNotEmpty) {
                      _auth.sendPasswordResetEmail(email: _email);
                    }
                  },
                  child: Text('Forgot password?'),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/signup'),
                  child: Text('Don\'t have an account? Sign up'),
                ),
                SizedBox(height: 20),
                SvgPicture.asset('assets/logos/ace_white.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
