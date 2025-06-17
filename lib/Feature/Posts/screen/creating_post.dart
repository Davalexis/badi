import 'package:badi/Core/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CreatingPostScreen extends StatelessWidget {
  const CreatingPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define colors from the image for reusability
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row with Back, Details, and Archive
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
                    child: Center(
                      child: Text(
                        'Create Post',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: CircleAvatar(
                      backgroundColor: kText,
                      radius: 30,
                      child: IconButton(
                        splashRadius: 30,
                        iconSize: 28,
                        onPressed: () {},
                        icon: Icon(
                          IconsaxPlusLinear.tick_square,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // --- User Info Section ---
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black, size: 30),
                ),
                title: const Text(
                  'David Dafe',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'Listing on Marketplace',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.storefront_outlined,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- Add Photos Section ---
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add_to_photos_outlined,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Add photos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Photos: 0/10 • Choose your listing's main photo first.",
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'How to take a great listing photo',
                        style: TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Form Fields ---
              _buildTextField(hint: 'Title', hintColor: Colors.black54),
              const SizedBox(height: 12),
              _buildTextField(
                hint: 'Price',
                hintColor: Colors.black54,
                keyboardType: TextInputType.number,
              ),
              
              const SizedBox(height: 12),
              _buildTextField(
                hint: 'Description',
                hintColor: Colors.black54,
                maxLines: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                child: Text(
                  'Optional',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 24),

              const Divider(),
              const SizedBox(height: 16),

              // --- Location Section ---
              const Text(
                'Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    'Kano, Nigeria • 7001',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Divider(),
              const SizedBox(height: 16),
              // --- Listing Options Section ---
              const Text(
                'Listing Options',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // ... Add more listing options widgets here if needed
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for a standard text input field
  Widget _buildTextField({
    required String hint,
    required Color hintColor,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: hintColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  // Helper widget for a dropdown field
  Widget _buildDropdownField({
    required String hint,
    required Color hintColor,
    required List<String> items,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
        ),
      ),
      hint: Text(
        hint,
        style: TextStyle(
          color: hintColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade700),
      items:
          items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (_) {},
    );
  }
}
