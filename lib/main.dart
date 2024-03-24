// File: main.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: the entry point for crevify mobile application

// Import Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_auth/firebase_auth.dart';

// Import local packages
import 'package:crevify/features/authentication/services/auth_service.dart'; 
import 'features/authentication/bloc/Auth_bloc/auth_bloc.dart';
import 'features/authentication/bloc/Auth_bloc/auth_state.dart';
import 'features/homepage/screens/homepage.dart'; 
import 'features/Onboarding/widgets/onboarding_widget.dart'; 
import 'features/splash_screen/screens/splash_screen.dart'; 
import 'features/authentication/screens/login_screen.dart'; // Import your LoginPage widget
import 'features/authentication/screens/signup_screen.dart'; // Comment out this line
import 'shared/theme/custom_theme.dart'; // Import your theme.dart file

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        Firebase.initializeApp(),
        Future.delayed(Duration(seconds: 7)),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider(
            create: (context) => AuthBloc(AuthenticationService(FirebaseAuth.instance)),
            child: MaterialApp(
              title: 'Crevify',
              theme: MediaQuery.platformBrightnessOf(context) == Brightness.dark ? MyTheme.darkTheme : MyTheme.lightTheme,
              home: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthInitial) {
                    return SplashScreen();
                  } else if (state is AuthAuthenticated) {
                    return HomePage(user: state.user); // Pass user to HomePage
                  } else {
                    return OnboardingWidget();
                  }
                },
              ),
              routes: {
                '/login': (context) => const LoginPage(),
                '/signup': (context) => const SignupPage(),
                '/home': (context) => HomePage(user: FirebaseAuth.instance.currentUser!),
              },
            ),
          );
        } else {
          return MaterialApp(home: SplashScreen());
        }
      },
    );
  }
}
