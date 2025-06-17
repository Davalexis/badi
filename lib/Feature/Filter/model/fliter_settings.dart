import 'package:flutter/material.dart';

class FilterSettings {
  final String type;
  final String category;
  final RangeValues priceRange;
  final String? city;
  final String? country;
  final String? bedrooms;
  final String? bathrooms;

  FilterSettings({
    required this.type,
    required this.category,
    required this.priceRange,
    this.city,
    this.country,
    this.bedrooms,
    this.bathrooms,
  });

  // A helper method to create a default instance
  factory FilterSettings.initial() {
    return FilterSettings(
      type: 'For Rent',
      category: 'All property',
      priceRange: const RangeValues(200, 4500),
      city: 'California',
      country: 'USA',
      bedrooms: '4 Rooms',
      bathrooms: '2 Bathrooms',
    );
  }

  @override
  String toString() {
    return 'Filters: \n'
           'Type: $type, Category: $category\n'
           'Price: \$${priceRange.start.round()} - \$${priceRange.end.round()}\n'
           'Location: $city, $country\n'
           'Rooms: $bedrooms, Bath: $bathrooms';
  }
}