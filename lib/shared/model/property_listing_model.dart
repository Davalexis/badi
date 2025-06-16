// ignore_for_file: public_member_api_docs, sort_constructors_first
class PropertyListingModel {
  final String id;
  final String image_url;
  final String price;
  final String state;
  final String address;
  final String bedroom;
  final double rating;
  final int reviewcount;
  late final bool isWhitelisted;

  PropertyListingModel({
    required this.id,
    required this.image_url,
    required this.price,
    required this.state,
    required this.address,
    required this.bedroom,
    required this.rating,
    required this.reviewcount,
    this.isWhitelisted = false,
  });
}
