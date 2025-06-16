import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/Feature/Home/widget/detail_screen_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:badi/shared/model/property_listing_model.dart';

class PropertiesDetailsScren extends StatefulWidget {
  final PropertyListingModel propertyListingModel;

  const PropertiesDetailsScren({super.key, required this.propertyListingModel});

  @override
  State<PropertiesDetailsScren> createState() => _PropertiesDetailsScrenState();
}

class _PropertiesDetailsScrenState extends State<PropertiesDetailsScren> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              DetailScreenHeaderWidget(),

              SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                              widget.propertyListingModel.image_url,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // 4 IMAGES FOR  FOR THE PROPERTY DETAIL SCREEN
                      Container(
                        height: 100,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Text(
                                    widget.propertyListingModel.state,
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    widget.propertyListingModel.address,
                                    style: TextStyle(),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Text(widget.propertyListingModel.price),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        height: 100,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      //TEXT FOR THE PROPERTY DETAIL SCREEN
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
