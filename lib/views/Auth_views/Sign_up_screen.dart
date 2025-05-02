import 'package:badi/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 70),

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

          SizedBox(height: 100),

          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(IconsaxPlusBold.message, size: 20),
                hintText: 'Enter email',
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

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: TextField(
              obscureText: obscurePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(IconsaxPlusBold.lock, size: 20),
                suffixIcon: IconButton(
                  onPressed: () {
                    obscurePassword ? Icons.visibility_off : Icons.visibility;
                  },
                  icon: Icon(IconsaxPlusBold.password_check),
                ),
                hintText: ' Create Password',
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: TextField(
              obscureText: obscurePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(IconsaxPlusBold.lock, size: 20),
                suffixIcon: IconButton(
                  onPressed: () {
                    obscurePassword ? Icons.visibility_off : Icons.visibility;
                  },
                  icon: Icon(IconsaxPlusBold.password_check),
                ),
                hintText: ' Confirm Password',
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 140,
              ),
              child: Text(
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
            ),
          ),

          SizedBox(height: 30),

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
                    children: [
                      Icon(FontAwesomeIcons.google),

                      SizedBox(
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

              SizedBox(height: 20),

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

                      SizedBox(
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

              SizedBox(height: 20),

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

                      SizedBox(
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
            ],
          ),
        ],
      ),
    );
  }
}
