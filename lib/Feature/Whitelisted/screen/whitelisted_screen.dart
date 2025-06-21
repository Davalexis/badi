import 'package:badi/Core/constants/Colors.dart';
import 'package:flutter/material.dart';

class WhitelistedScreen extends StatelessWidget {
  const WhitelistedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'No whitelisted properties.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
