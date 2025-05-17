import 'package:badi/constants/Colors.dart';
import 'package:badi/views/Auth_views/Auth_widgets/login_form_wigdet.dart';
import 'package:badi/views/Auth_views/Auth_widgets/social_login_form_widget.dart';
import 'package:badi/views/Auth_views/Auth_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  //  bool agreeTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget_2(),

                SizedBox(height: 20),

                LoginFormWigdet(),

                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Outputs a horizontal Divider with the text placed in the center.
                        //   TextDivider.horizontal(text: const Text('Horizontal Test')),
                        // Outputs a vertical Divider with the text placed in the center.
                        //   TextDivider.vertical(text: const Text('Vertical Test')),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15),

                SocialLoginFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
