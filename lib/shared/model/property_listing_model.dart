class PropertyListingModel {
  final String title;
  final String price;
  final String description;
  final String address;
  final String bedroom; // Kept for consistency with your details screen
  final List<String> imagePaths; // Changed to a list of file paths

  PropertyListingModel({
    required this.title,
    required this.price,
    required this.description,
    required this.address,
    required this.bedroom,
    required this.imagePaths,
  });
}