
import 'package:badi/model/property_listing_model.dart';
import 'package:badi/views/Home_views/properties_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:badi/constants/Colors.dart';

class PropertiesCardWidget extends StatefulWidget {
  final PropertyListingModel propertyListingModel;
  const PropertiesCardWidget({super.key, required this.propertyListingModel});

  @override
  State<PropertiesCardWidget> createState() => _PropertiesCardWidgetState();
}

class _PropertiesCardWidgetState extends State<PropertiesCardWidget> {
  late bool isWhitelisted;
  @override
  void initState() {
    super.initState();
    isWhitelisted = widget.propertyListingModel.isWhitelisted;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PropertiesDetailsScren(propertyListingModel: widget.propertyListingModel))); 
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
                  image: AssetImage(widget.propertyListingModel.image_url),
                  fit: BoxFit.cover,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: kText,
                radius: 23,
                child: IconButton(
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
      
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1.5),
                    child: Text(
                      widget.propertyListingModel.price,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Special Gothic Expanded One',
                        fontWeight: FontWeight.w600,
                        color: kPrimary,
                      ),
                    ),
                  ),
      
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.propertyListingModel.state,
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
  }
}
