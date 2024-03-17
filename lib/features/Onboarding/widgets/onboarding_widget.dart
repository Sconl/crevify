import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:animated_text_kit/animated_text_kit.dart';

import '../models/onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  @override
  void initState() {
    super.initState();
    _model = OnboardingModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _model.pageViewController ??=
                      PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPage(
                      imageUrl: 'assets/images/splash_screen_1.jpg',
                      title: 'Welcome to Crevify!',
                      subtitle: 'Where Healthy Meets Delicious!',
                    ),
                    _buildPage(
                      imageUrl: 'assets/images/splash_screen_2.jpg',
                      title: 'No Time? No Problem!',
                      subtitle: 'Healthy Meals, Delivered Fast!',
                    ),
                    _buildPage(
                      imageUrl: 'assets/images/splash_screen_3.jpg',
                      title: 'Eat Well, Live Well!',
                      subtitle: 'Nutritious Meals for Campus Life!',
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      count: 3,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: const smooth_page_indicator.ExpandingDotsEffect(
                        expansionFactor: 4,
                        spacing: 8,
                        radius: 40,
                        dotWidth: 10,
                        dotHeight: 10,
                        dotColor: Color(0xFFD9D9D9),
                        activeDotColor: Color.fromARGB(255, 0, 143, 0),
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 14),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Ready, Set, Go!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 36),
          SizedBox(
            height: 50,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText(
                  'Chop it up!',
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 150), // Reduce speed
                ),
                TyperAnimatedText(
                  'Whisk it away!',
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 150), // Reduce speed
                ),
                TyperAnimatedText(
                  'Savor the flavor!',
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 150), // Reduce speed
                ),
                TyperAnimatedText(
                  'Slice and dice!',
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 150), // Reduce speed
                ),
                TyperAnimatedText(
                  'Cook with passion!',
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 150), // Reduce speed
                ),
                TyperAnimatedText(
                  'Taste the magic!',
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 150), // Reduce speed
                ),
                TyperAnimatedText(
                  'Spice it up!',
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 150), // Reduce speed
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
      child: Container(
        color: const Color(0x990F1113),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            SvgPicture.asset(
              'assets/logos/crevify_logo_vertical_main_white.svg',
              height: 160,
              width: 160,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
