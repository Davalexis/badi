import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/Feature/Auth/screen/Sign_up_screen.dart';
import 'package:badi/Feature/Navigation/Nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool agreeTerms = false;
  bool obscurePassword = true;
  //  bool agreeTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TextWidget_2(),
                    Column(
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
                    ),

                    SizedBox(height: 20),

                    // LoginFormWigdet(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                IconsaxPlusBold.message,
                                size: 20,
                              ),
                              hintText: 'Email',
                              filled: true,
                              fillColor: Colors.white,
                              //  contentPadding: EdgeInsets.symmetric(vertical: 18),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: TextField(
                            obscureText: obscurePassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(IconsaxPlusBold.lock, size: 20),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  obscurePassword
                                      ? Icons.visibility_off 
                                      : Icons.visibility;
                                },
                                icon: Icon(IconsaxPlusBold.password_check),
                              ),
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.white,

                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 5),

                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  color: Colors.black.withOpacity(0.7),
                                ),

                                activeColor: kPrimary,
                                value: agreeTerms,
                                onChanged: (value) {
                                  setState(() {
                                    agreeTerms = value!;
                                  });
                                },
                              ),

                              Text(
                                'i agree to all terms and conditions',
                                style: TextStyle(
                                  fontFamily: '',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 140,
                            ),
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                    // SocialLoginFormWidget(),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kText,
                            foregroundColor: Colors.black87,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 80,
                            ),
                            child: Row(
                              spacing: 5,
                              children: [Icon(FontAwesomeIcons.google)],
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 80,
                            ),
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 70,
                            ),
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 80,
                            ),
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
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(color: kPrimary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
       ] ),
      ),
    );
  }
}
