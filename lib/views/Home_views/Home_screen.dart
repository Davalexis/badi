import 'package:badi/constants/Colors.dart';
import 'package:badi/data/property_listing.dart';
import 'package:badi/model/property_listing_model.dart';
import 'package:badi/views/Home_views/widget/home_screen_hearder.dart';
import 'package:badi/views/Home_views/widget/properties_gridveiw_widget.dart';
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
            HomeScreenHearder(),            
            Expanded(child: PropertiesGridviewWidget(property: properties)),
            // ignore: avoid_print
            // pri nt("Number of properties : ${property.length}");
          ],
        ),
      ),
    );
  }
}
