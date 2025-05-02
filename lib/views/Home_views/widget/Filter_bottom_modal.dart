import 'package:badi/constants/Colors.dart';
import 'package:family_bottom_sheet/family_bottom_sheet.dart';
import 'package:flutter/material.dart';


final List<String> genderItems = [
  'kano ',
  'Lagos',
  'kaduna',
  'Ibadan',
];

String? selectedValue;

final _formKey = GlobalKey<FormState>();


Future<void> openOptionsModal(BuildContext context) async {
  await FamilyModalSheet.show<void>(
    mainContentPadding: EdgeInsets.all(20),
    context: context,
    contentBackgroundColor: kBackground,
    builder: (context) {
      return SizedBox(
        height: 500, 
        width: double.maxFinite,
        child: Column(
          children: [
          
          ],

        ),
        
        );
    },
  );
}

