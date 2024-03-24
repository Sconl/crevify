import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_auth/firebase_auth.dart';
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
    return MaterialApp(
      title: 'Crevify',
      theme: MediaQuery.platformBrightnessOf(context) == Brightness.dark ? MyTheme.darkTheme : MyTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
              future: Future.wait([
                Firebase.initializeApp(),
                Future.delayed(Duration(seconds: 10)),
              ]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return BlocProvider(
                    create: (context) => AuthBloc(AuthenticationService(FirebaseAuth.instance)),
                    child: BlocBuilder<AuthBloc, AuthState>(
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
                  );
                } else {
                  return SplashScreen();
                }
              },
            ),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(), // This will now refer to the SignupPage from login_page.dart
        '/home': (context) => HomePage(user: FirebaseAuth.instance.currentUser!), // Add this line to define the route to the HomePage
        // other routes...
      },
    );
  }
}
