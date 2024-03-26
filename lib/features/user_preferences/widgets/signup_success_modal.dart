// File: signup_success_modal.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: A success modal for signup with styled text, a confetti effect, and a circle shape

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import '../../../shared/theme/custom_theme.dart';

class SignupSuccessModal extends StatefulWidget {
  @override
  _SignupSuccessModalState createState() => _SignupSuccessModalState();
}

class _SignupSuccessModalState extends State<SignupSuccessModal> {
  late ConfettiController _controllerLeft;
  late ConfettiController _controllerRight;
  late String firstName = '';

  @override
  void initState() {
    super.initState();
    _controllerLeft = ConfettiController(duration: Duration(seconds: 2));
    _controllerRight = ConfettiController(duration: Duration(seconds: 2));
    _controllerLeft.play();
    _controllerRight.play();
    _getFirstName();
  }

  Future<void> _getFirstName() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        firstName = user.displayName?.split(' ')[0] ?? user.email!;
      });
    }
  }

  @override
  void dispose() {
    _controllerLeft.dispose();
    _controllerRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            bottom: -MediaQuery.of(context).size.width / 3,
            right: -MediaQuery.of(context).size.width / 3,
            child: Container(
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: MediaQuery.of(context).size.width * 2 / 3,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: AlertDialog(
              title: Text(
                'Awesome! 😃', // Headline
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome Aboard, $firstName! 💯', // Subhead
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Your Crevify account is all set up. Personalize your preferences, Explore restaurants, Follow amazing Chefs and unlock exclusive rewards!', // Body Text
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.5),
                    textAlign: TextAlign.center,
                  ),
                  ConfettiWidget(
                    confettiController: _controllerLeft,
                    blastDirectionality: BlastDirectionality.explosive, // particles shoot in all directions
                    maxBlastForce: 200, // set a higher max blast force
                    minBlastForce: 100, // set a higher min blast force
                    emissionFrequency: 0.2, // increase the emission frequency
                    numberOfParticles: 20, // number of particles to emit
                    gravity: 0.5, // reduce the gravity slightly
                    particleDrag: 0.05, // apply drag to the confetti
                    colors: [Colors.green, Colors.blue, Colors.pink], // manually specify the colors to be used
                  ),
                  ConfettiWidget(
                    confettiController: _controllerRight,
                    blastDirectionality: BlastDirectionality.explosive, // particles shoot in all directions
                    maxBlastForce: 200, // set a higher max blast force
                    minBlastForce: 100, // set a higher min blast force
                    emissionFrequency: 0.2, // increase the emission frequency
                    numberOfParticles: 15, // number of particles to emit
                    gravity: 0.5, // reduce the gravity slightly
                    particleDrag: 0.05, // apply drag to the confetti
                    colors: [Colors.green, Colors.yellow, Color.fromARGB(255, 253, 73, 2)], // manually specify the colors to be used
                  ),
                ],
              ),
              actions: <Widget>[
                Center(
                  child: TextButton(
                    child: Text(
                      'Start Exploring!', // Button Text
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
