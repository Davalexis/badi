import 'package:badi/views/Auth_views/login_screen.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 20,
      top: 790,
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }
}
