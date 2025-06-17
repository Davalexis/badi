import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/Feature/Auth/screen/Login_screen.dart';
import 'package:badi/Feature/Navigation/Nav_screen.dart';
import 'package:badi/shared/widget/button_widget.dart';
import 'package:flutter/material.dart'; 
import 'package:iconsax_plus/iconsax_plus.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                 Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(IconsaxPlusBold.profile, size: 20),
                          hintText: 'First Name',
                          filled: true,
                          fillColor: Colors.white,
                           contentPadding: EdgeInsets.symmetric(vertical: 18),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                  
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(IconsaxPlusBold.message, size: 20),
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 15),

                      TextField(
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
                          hintText: ' Create Password',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 15),

                      Row(
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

                      SizedBox(height: 15),
                      ButtonWidget(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavScreen(),
                            ),
                          );
                        },
                        buttonText: "Sign up",
                      ),
                     

                      SizedBox(height: 20),


                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Text(
                            'Create an account',
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
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Login ',
                              style: TextStyle(color: kPrimary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
