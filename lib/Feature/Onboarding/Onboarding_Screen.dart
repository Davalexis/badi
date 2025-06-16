import 'package:badi/Feature/Onboarding/button_widget.dart';
import 'package:badi/Feature/Onboarding/text_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black.withOpacity(0.9),
                ],
                stops: [0.2, 0.4, 0.7],
              ),
            ),
          ),
          TextWidget(),
          ButtonWidget(),
        ],
      ),
    );
  }
}
