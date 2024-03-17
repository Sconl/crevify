import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../shared/theme/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.darkTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 64.0),
              Image.asset(
                'assets/logos/_Iconmark_Main.webp',
                height: 100.0,
                width: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Welcome Back!',
                  style: MyTheme.darkTheme.textTheme.headlineLarge!,
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Your journey awaits. Log in to access all the features.',
                  style: MyTheme.darkTheme.textTheme.bodyText1!,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildInputField(MdiIcons.accountOutline, 'Username/Email'),
                    SizedBox(height: 20.0),
                    _buildPasswordField(),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                        backgroundColor: MyTheme.lightTheme.primaryColor,
                      ),
                      child: Text(
                        'Log In',
                        style: MyTheme.lightTheme.textTheme.button,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'or',
                      style: MyTheme.lightTheme.textTheme.button?.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.0),
                    OutlinedButton(
                      onPressed: () {
                        // Perform login with Google action
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                        side: BorderSide(color: MyTheme.lightTheme.primaryColor!),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            MdiIcons.google,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Log In with Google',
                            style: MyTheme.lightTheme.textTheme.button,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'New to Crevify? ',
                      style: MyTheme.lightTheme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Create Account',
                          style: TextStyle(
                            color: MyTheme.lightTheme.primaryColor!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Powered By',
                        style: TextStyle(
                          color: MyTheme.darkTheme.textTheme.bodyText1!.color!.withOpacity(0.54),
                          fontSize: 9,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      SvgPicture.asset(
                        'assets/logos/Ace_Cyber_Space_Logo_Horizontal_Full_Lockup_White.svg',
                        height: 35.0,
                        width: 105.0,
                        color: MyTheme.darkTheme.textTheme.bodyText1!.color!.withOpacity(0.87),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String hintText) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            icon,
            color: MyTheme.lightTheme.textTheme.bodyText1!.color,
            size: 20.0,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: MyTheme.lightTheme.textTheme.bodyText1!.color!.withOpacity(0.6)),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: MyTheme.lightTheme.textTheme.bodyText1!.color),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            MdiIcons.lockOutline,
            color: MyTheme.lightTheme.textTheme.bodyText1!.color,
            size: 20.0,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: MyTheme.lightTheme.textTheme.bodyText1!.color!.withOpacity(0.6)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: MyTheme.lightTheme.textTheme.bodyText1!.color),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implement your forgot password logic here
                },
                child: Text(
                  'Forgot?',
                  style: TextStyle(
                    color: MyTheme.lightTheme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
