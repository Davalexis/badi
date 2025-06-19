import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:badi/Core/constants/Colors.dart';

class CreatingPostScreen extends StatefulWidget {
  const CreatingPostScreen({super.key});

  @override
  State<CreatingPostScreen> createState() => _CreatingPostScreenState();
}

class _CreatingPostScreenState extends State<CreatingPostScreen> {
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _images.add(File(picked.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopRow(context),
              const SizedBox(height: 16),
              _buildUserInfo(),
              const SizedBox(height: 24),

              // Add Photos Section
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
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
                      "Photos: ${_images.length}/10 • Choose your listing's main photo first.",
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Display selected images with cancel icon
              if (_images.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        _images.asMap().entries.map((entry) {
                          final index = entry.key;
                          final img = entry.value;

                          return Stack(
                            children: [
                              Card(
                                margin: const EdgeInsets.only(right: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    img,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 20,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _images.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.6),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                  ),
                ),

              const SizedBox(height: 16),
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
              const Padding(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                child: Text(
                  'Optional',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 24),

              const Divider(),
              const SizedBox(height: 16),
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
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              // const Text(
              //   'Listing Options',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
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
        Container(
          height: 70,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
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
        CircleAvatar(
          backgroundColor: kText,
          radius: 30,
          child: IconButton(
            splashRadius: 30,
            iconSize: 24,
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: Icon(Icons.person, color: Colors.black, size: 30),
      ),
      title: const Text(
        'David Dafe',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Row(
        children: const [
          Text(
            'Listing on Marketplace',
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(width: 4),
          Icon(Icons.storefront_outlined, color: Colors.black54, size: 16),
        ],
      ),
    );
  }

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
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
