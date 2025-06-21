import 'package:badi/Feature/Filter/screen/Filter_bottom_modal.dart';
import 'package:badi/Feature/Posts/screen/creating_post.dart';
import 'package:badi/shared/model/property_listing_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HomeScreenHeader extends StatefulWidget {
  const HomeScreenHeader({super.key});

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {

  final List<PropertyListingModel> _propertyList = [];

    void _createNewPost() async {
    final newListing = await Navigator.push<PropertyListingModel>(
      context,
      MaterialPageRoute(builder: (context) => const CreatingPostScreen()),
    );

    if (newListing != null) {
      setState(() {
        _propertyList.insert(0, newListing);
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: IconButton(
              icon: Icon(IconsaxPlusLinear.messages_3),
              onPressed: () {},
            ),
          ),

          GestureDetector(
            onTap: () {
              // WHEN TAP IT CALL  AND BOTTOM MODAL UI
              openOptionsModal(context);
            },

            child: Container(
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
                    " Nigeria",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Text(
                    "4-5 Feb,2025.2 guests",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: IconButton(
              icon: Icon(IconsaxPlusLinear.add),
              onPressed: () {
                // WHEN TAP IT CALL THE CREATING POST SCREEN
                _createNewPost();
              },
            ),
          ),
        ],
      ),
    );
  }
}
