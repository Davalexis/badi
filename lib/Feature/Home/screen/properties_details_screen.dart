import 'package:badi/Core/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:badi/shared/model/property_listing_model.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class PropertiesDetailsScreen extends StatefulWidget {
  final PropertyListingModel propertyListingModel;

  const PropertiesDetailsScreen({
    super.key,
    required this.propertyListingModel,
  });

  @override
  State<PropertiesDetailsScreen> createState() =>
      _PropertiesDetailsScreenState();
}

class _PropertiesDetailsScreenState extends State<PropertiesDetailsScreen> {
  bool isWhitelisted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: Column(
          children: [
            // Your existing header widget
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
    ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                // Using horizontal padding for the main content area
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Image Carousel Section ---
                      _buildImageCarousel(),
                      const SizedBox(height: 24),

                      // --- Location Section (Now wrapped in a container) ---
                      _buildLocationSection(),
                      const SizedBox(height: 24),

                      // --- Amenities Grid Section ---
                      _buildAmenitiesGrid(),
                      const SizedBox(height: 24),

                      // --- Action Buttons Section ---
                      _buildActionButtons(),
                      const SizedBox(height: 20), // For bottom spacing
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the image and pagination dots
  Widget _buildImageCarousel() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            widget.propertyListingModel.image_url,
            fit: BoxFit.cover,
            height: 320,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Icon(
                  Icons.hide_image_outlined,
                  color: Colors.grey,
                  size: 50,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Pagination dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 6),
            _buildDot(color: Colors.grey.shade300),
            const SizedBox(width: 6),
            _buildDot(color: Colors.grey.shade300),
            const SizedBox(width: 6),
            _buildDot(color: Colors.grey.shade300),
          ],
        ),
      ],
    );
  }

  // Helper for creating a single pagination dot
  Widget _buildDot({required Color color}) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  // Widget for the location and property type
  Widget _buildLocationSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
            children: [
              Text(
                widget.propertyListingModel.state,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                widget.propertyListingModel.price,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black54,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.propertyListingModel.address,
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.apartment_outlined,
                    color: Colors.black54,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  const Text('Flats', style: TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget for the grid of amenities
  Widget _buildAmenitiesGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAmenityItem(
                Icons.bed_outlined,
                widget.propertyListingModel.bedroom,
              ),
              _buildAmenityItem(Icons.bathtub_outlined, '1 Bath rooms'),
              _buildAmenityItem(Icons.fullscreen_outlined, '1500 sq ft'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAmenityItem(
                Icons.shopping_cart_outlined,
                'Shopping center',
              ),
              _buildAmenityItem(Icons.pool_outlined, 'Private pool'),
              _buildAmenityItem(
                Icons.fitness_center_outlined,
                'Fitness Center',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for creating a single amenity item
  Widget _buildAmenityItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ],
    );
  }

  // Widget for the action buttons at the bottom
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          // UPDATED: Changed to OutlinedButton.icon
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(IconsaxPlusLinear.messages_3, size: 24),
            label: const Text('Message'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.black,
              elevation: 0.2,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text('Rent Now'),
          ),
        ),
      ],
    );
  }
}