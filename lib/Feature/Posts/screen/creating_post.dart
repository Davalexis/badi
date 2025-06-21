import 'dart:io';
import 'package:badi/shared/model/property_listing_model.dart'; // Import the model
import 'package:badi/shared/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:badi/Core/constants/Colors.dart';
import 'package:image_picker/image_picker.dart';

class CreatingPostScreen extends StatefulWidget {
  const CreatingPostScreen({super.key});

  @override
  State<CreatingPostScreen> createState() => _CreatingPostScreenState();
}

class _CreatingPostScreenState extends State<CreatingPostScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    if (_images.length >= 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You can add a maximum of 10 photos."),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      );
      return;
    }
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _images.add(File(picked.path)));
    }
  }

  void _publishPost() {
    if (_images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one photo.')),
      );
      return;
    }
    // Validate the form fields
    if (_formKey.currentState?.validate() ?? false) {
      final newListing = PropertyListingModel(
        title: _titleController.text,
        price: _priceController.text,
        description: _descriptionController.text,
        address: 'Kano, Nigeria • 7001', // Static for this example
        bedroom: '3 Beds', // Static for this example
        imagePaths: _images.map((file) => file.path).toList(),
      );
      // Return the new object to the HomeScreen
      Navigator.pop(context, newListing);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      onTap: () {},
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
                              " Add post",
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
                        icon: const Icon(IconsaxPlusLinear.more),
                      ),
                    ),
                  ],
                ),
                _buildUserInfo(),
                const SizedBox(height: 24),
                _buildPhotoSection(),
                const SizedBox(height: 24),
                _buildTextField(controller: _titleController, hint: 'Title'),
                const SizedBox(height: 12),
                _buildTextField(
                  controller: _priceController,
                  hint: 'Price',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  controller: _descriptionController,
                  hint: 'Description',
                  maxLines: 4,
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
                const SizedBox(height: 40),
                ButtonWidget(
                  onPressed: _publishPost,
                  buttonText: 'Publish Post',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoSection() {
    if (_images.isEmpty) {
      return Center(child: _buildAddInitialPhotoButton());
    }
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return _buildAddMoreButton();
          final imgIndex = index - 1;
          return _buildImageCard(_images[imgIndex], imgIndex);
        },
      ),
    );
  }

  Widget _buildAddInitialPhotoButton() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 40,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildAddMoreButton() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40, color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildImageCard(File image, int index) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.only(right: 12),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.file(image, width: 120, height: 120, fit: BoxFit.cover),
        ),
        Positioned(
          top: 4,
          right: 20,
          child: GestureDetector(
            onTap: () => setState(() => _images.removeAt(index)),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: const CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      child: Icon(Icons.person, color: Colors.black, size: 30),
    ),
    title: const Text(
      'David Dafe',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    subtitle: Row(
      children: const [
        Text('Listing on Marketplace', style: TextStyle(color: Colors.black54)),
        SizedBox(width: 4),
        Icon(Icons.storefront_outlined, color: Colors.black54, size: 16),
      ],
    ),
  );

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator:
          (value) =>
              (value == null || value.isEmpty) ? 'Please enter a $hint' : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black54,
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
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
