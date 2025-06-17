import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/shared/data/property_listing.dart';
import 'package:badi/shared/model/property_listing_model.dart';
import 'package:badi/Feature/Home/widget/home_screen_hearder.dart';
import 'package:badi/Feature/Home/widget/properties_gridveiw_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<PropertyListingModel> property;
  const HomeScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            HomeScreenHeader(),            
            Expanded(child: PropertiesGridviewWidget(property: properties)),
            // ignore: avoid_print
            // print("Number of properties : ${property.length}");
          ],
        ),
      ),
    );
  }
}
