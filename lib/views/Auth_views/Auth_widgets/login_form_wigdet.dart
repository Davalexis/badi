import 'package:badi/constants/Colors.dart';
import 'package:badi/views/Navigation_veiw/Nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class LoginFormWigdet extends StatefulWidget {
  const LoginFormWigdet({super.key});

  @override
  State<LoginFormWigdet> createState() => _LoginFormWigdetState();
}

class _LoginFormWigdetState extends State<LoginFormWigdet> {
  bool agreeTerms = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(IconsaxPlusBold.message, size: 20),
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
                  obscurePassword ? Icons.visibility_off : Icons.visibility;
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
                side: BorderSide(color: Colors.black.withOpacity(0.7)),

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
              MaterialPageRoute(builder: (context) => NavScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 140),
            child: Text(
              'Log in',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
