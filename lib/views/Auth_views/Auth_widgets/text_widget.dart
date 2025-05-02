import 'package:badi/constants/Colors.dart';
import 'package:flutter/material.dart';

class TextWidget_2 extends StatelessWidget {
  const TextWidget_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "badi",
            style: TextStyle(
              fontFamily: '',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
          ),
        ),

        SizedBox(height: 20),

        Center(
          child: Text(
            "Let's create your account",
            style: TextStyle(
              fontFamily: '',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),

        SizedBox(height: 5),

        Center(
          child: Text(
            "Unlock your personalised experience",
            style: TextStyle(
              fontFamily: '',
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
