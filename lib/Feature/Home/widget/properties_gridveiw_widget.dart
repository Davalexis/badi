import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/Feature/Home/screen/properties_details_screen.dart';
import 'package:badi/shared/model/property_listing_model.dart';
import 'package:flutter/material.dart';

class PropertiesGridviewWidget extends StatefulWidget {
  final List<PropertyListingModel> property;
  const PropertiesGridviewWidget({super.key, required this.property});

  @override
  State<PropertiesGridviewWidget> createState() =>
      _PropertiesGridviewWidgetState();
}

class _PropertiesGridviewWidgetState extends State<PropertiesGridviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 30,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.property.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PropertiesDetailsScreen(
                      propertyListingModel: widget.property[index],
                    ),
              ),
            );
          },
          child: Card.outlined(
            color: kText,
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(width: 0.2, color: Colors.transparent),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  height: 180,
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.property[index].image_url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1.5),
                        child: Text(
                          widget.property[index].price,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: kPrimary,
                          ),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.property[index].state,
                            style: TextStyle(
                              fontFamily: 'Special Gothic Expanded One',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
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
        );
      },
    );
  }
}
