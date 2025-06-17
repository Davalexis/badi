import 'package:badi/Core/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class DetailScreenHeaderWidget extends StatefulWidget {
  const DetailScreenHeaderWidget({super.key});

  @override
  State<DetailScreenHeaderWidget> createState() =>
      _DetailScreenHeaderWidgetState();
}

class _DetailScreenHeaderWidgetState extends State<DetailScreenHeaderWidget> {
  bool isWhitelisted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
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

        Container(
          child: CircleAvatar(
            backgroundColor: kText,
            radius: 30,
            child: IconButton(
             splashRadius:30 ,
             iconSize: 28,
              onPressed: () {
                setState(() {
                  isWhitelisted = !isWhitelisted;
                });
              },
              icon: Icon(
                isWhitelisted
                    ? IconsaxPlusBold.archive_minus
                    : IconsaxPlusLinear.archive_minus,
                color: isWhitelisted ? kPrimary : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
