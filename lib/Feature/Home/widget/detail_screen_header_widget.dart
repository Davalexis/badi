import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class DetailScreenHeaderWidget extends StatelessWidget {
  const DetailScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(IconsaxPlusLinear.arrow_left_1),
                    ),
                  ),

                  Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(IconsaxPlusLinear.archive_minus),
                  ),
                ],
              );
  }
}