import 'dart:io';
import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/shared/model/property_listing_model.dart';
import 'package:badi/Feature/Home/widget/home_screen_hearder.dart';
import 'package:badi/Feature/Home/screen/properties_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // CORRECTED: The constructor now correctly accepts and passes the key.
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This list will now be correctly preserved.
  late List<PropertyListingModel> _propertyList;

  @override
  void initState() {
    super.initState();
    _propertyList = [];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            const HomeScreenHeader(),
            Expanded(
              child:
                  _propertyList.isEmpty
                      ? const Center(
                        child: Text(
                          'No listings yet.\nTap the + button to create one!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      )
                      : PropertiesGridviewWidget(property: _propertyList),
            ),
          ],
        ),
      ),
    );
  }
}

// No changes are needed to PropertiesGridviewWidget. It remains the same.
class PropertiesGridviewWidget extends StatelessWidget {
  final List<PropertyListingModel> property;
  const PropertiesGridviewWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: property.length,
      itemBuilder: (BuildContext context, int index) {
        final currentProperty = property[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PropertiesDetailsScreen(
                      propertyListingModel: currentProperty,
                    ),
              ),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: _buildPropertyImage(currentProperty.imagePaths),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentProperty.price.startsWith('\$')
                            ? currentProperty.price
                            : '\$${currentProperty.price}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: kPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentProperty.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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

  Widget _buildPropertyImage(List<String> imagePaths) {
    if (imagePaths.isEmpty) {
      return Container(
        color: Colors.grey[200],
        child: const Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 40,
        ),
      );
    }
    return Image.file(File(imagePaths[0]), fit: BoxFit.cover);
  }
}
