import 'dart:io';
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
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Using a proper AppBar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(IconsaxPlusLinear.arrow_left_1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // WHEN TAP IT CALL  AND BOTTOM MODAL UI
                     
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
                            " Details",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
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
                      onPressed: () {},
                      icon: const Icon(IconsaxPlusLinear.archive_minus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildImageCarousel(),
                      const SizedBox(height: 24),
                      _buildInfoSection(), // Combined info section
                      const SizedBox(height: 24),
                      _buildAmenitiesGrid(),
                      const SizedBox(height: 24),
                      // Add the description section
                      _buildDescriptionSection(),
                      const SizedBox(height: 24),
                      _buildActionButtons(),
                      const SizedBox(height: 20),
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

  // UPDATED: Image Carousel now uses a PageView
  Widget _buildImageCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: widget.propertyListingModel.imagePaths.length,
              itemBuilder: (context, index) {
                return Image.file(
                  File(widget.propertyListingModel.imagePaths[index]),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        if (widget.propertyListingModel.imagePaths.length > 1) ...[
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.propertyListingModel.imagePaths.length,
              (index) => _buildDot(isActive: index == _currentPage),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? kPrimary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  // Combined title, price, and location into one widget
  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.propertyListingModel.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            widget.propertyListingModel.price.startsWith('\$')
                ? widget.propertyListingModel.price
                : '\$${widget.propertyListingModel.price}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
          ),
          const SizedBox(height: 10),
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
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // NEW: Section to display the description
  Widget _buildDescriptionSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            widget.propertyListingModel.description,
            style: const TextStyle(color: Colors.black54, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenitiesGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAmenityItem(
            Icons.bed_outlined,
            widget.propertyListingModel.bedroom,
          ),
          _buildAmenityItem(Icons.bathtub_outlined, '1 Bath'),
          _buildAmenityItem(Icons.fullscreen_outlined, '1500 sq ft'),
        ],
      ),
    );
  }

  Widget _buildAmenityItem(IconData icon, String label) => Column(
    children: [
      Icon(icon, color: Colors.black54, size: 28),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(color: Colors.black54)),
    ],
  );

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
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
