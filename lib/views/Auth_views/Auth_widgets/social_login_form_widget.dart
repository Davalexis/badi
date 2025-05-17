import 'package:badi/constants/Colors.dart';
import 'package:badi/views/Auth_views/Sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginFormWidget extends StatelessWidget {
  const SocialLoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kText,
            foregroundColor: Colors.black87,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
            child: Row(
              spacing: 5,
              children: [
                Icon(FontAwesomeIcons.google),

                Center(
                  child: Text(
                    'continue with google ',
                    style: TextStyle(
                      fontFamily: '',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 15),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kText,
            foregroundColor: Colors.black87,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
            child: Row(
              spacing: 5,
              children: [
                Icon(FontAwesomeIcons.facebook),

                Center(
                  child: Text(
                    'Continue with facebook ',
                    style: TextStyle(
                      fontFamily: '',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 15),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kText,
            foregroundColor: Colors.black87,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
            child: Row(
              spacing: 5,
              children: [
                Icon(FontAwesomeIcons.apple),

                Center(
                  child: Text(
                    'Conutinue with apple ',
                    style: TextStyle(
                      fontFamily: '',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),

        Row(
          children: [
            Text(
              'Already have an account ?',
              style: TextStyle(
                fontFamily: '',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(0.5),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Sign up', style: TextStyle(color: kPrimary)),
            ),
          ],
        ),
      ],
    );
  }
}
