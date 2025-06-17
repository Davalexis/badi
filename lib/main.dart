import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/Feature/Onboarding/screen/Onboarding_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'badi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBackground),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white, // Text color
            backgroundColor: kPrimary, // Button background
            // minimumSize: const Size(double.infinity, 30),
            // Full width, fixed height
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(
                color: kPrimary,
                strokeAlign: BorderSide.strokeAlignInside,
                style: BorderStyle.none,
              ),
            ),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}
