import 'package:badi/Core/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search for properties...',
                  prefixIcon: Icon(
                    IconsaxPlusLinear.search_normal_1,
                    color: Colors.black54,
                    size: 30,
                  ),
                  hintStyle: TextStyle(
                   
                    color: Colors.black54.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  focusColor: kPrimary
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
