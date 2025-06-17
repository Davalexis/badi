import 'package:badi/Feature/Filter/model/fliter_settings.dart';
import 'package:family_bottom_sheet/family_bottom_sheet.dart';
import 'package:flutter/material.dart';
// Import the new data class

// Assuming you have this constant defined.
const Color kPrimary = Color(0xFF2196F3);
const Color kBackground = Colors.white;

// --- DUMMY DATA ---
final List<String> cityItems = ['California', 'New York', 'Texas'];
final List<String> countryItems = ['USA', 'Canada', 'Mexico'];
final List<String> roomItems = ['1 Room', '2 Rooms', '3 Rooms', '4 Rooms'];
final List<String> bathroomItems = ['1 Bathroom', '2 Bathrooms', '3 Bathrooms'];

// --- THE MAIN FUNCTION TO SHOW THE MODAL ---
// It now returns a Future that might contain FilterSettings
Future<FilterSettings?> openOptionsModal(BuildContext context) async {
  return await FamilyModalSheet.show<FilterSettings>(
    context: context,
    contentBackgroundColor: kBackground,
    mainContentPadding: EdgeInsets.zero,
    builder: (context) {
      // Use StatefulBuilder to manage the state of the filters locally
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          // --- STATE VARIABLES FOR FILTERS ---
          // Initialize state from the default FilterSettings model
          var currentSettings = FilterSettings.initial();

          void resetFilters() {
            setState(() {
              // Reset state by creating a new initial model
              currentSettings = FilterSettings.initial();
            });
          }

          // ... (Helper widgets _buildFilterChip, _buildCategoryChip, etc. remain the same)
          Widget _buildFilterChip(String label) {
            bool isSelected = currentSettings.type == label;
            return ChoiceChip(
              label: Text(label), selected: isSelected,
              onSelected: (selected) {
                if (selected) setState(() { currentSettings = FilterSettings(type: label, category: currentSettings.category, priceRange: currentSettings.priceRange, city: currentSettings.city, country: currentSettings.country, bedrooms: currentSettings.bedrooms, bathrooms: currentSettings.bathrooms); });
              },
              backgroundColor: kBackground, selectedColor: kPrimary,
              labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black54),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey.shade300)),
              showCheckmark: false, padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            );
          }
          Widget _buildCategoryChip(String label) {
            bool isSelected = currentSettings.category == label;
            return ChoiceChip(
              label: Text(label), selected: isSelected,
              onSelected: (selected) {
                if (selected) setState(() { currentSettings = FilterSettings(type: currentSettings.type, category: label, priceRange: currentSettings.priceRange, city: currentSettings.city, country: currentSettings.country, bedrooms: currentSettings.bedrooms, bathrooms: currentSettings.bathrooms); });
              },
              backgroundColor: kBackground, selectedColor: kPrimary,
              labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black54, fontSize: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: isSelected ? kPrimary : Colors.grey.shade300)),
              showCheckmark: false, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            );
          }
          Widget _buildSectionTitle(String title) => Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87));
          Widget _buildDropdown(String? value, List<String> items, Function(String?) onChanged) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(color: kBackground, borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Colors.grey.shade300, width: 1)),
              child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: value, isExpanded: true, icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey), items: items.map<DropdownMenuItem<String>>((String item) => DropdownMenuItem<String>(value: item, child: Text(item, style: const TextStyle(color: Colors.black54)))).toList(), onChanged: onChanged)),
            );
          }
          // The rest of the build method...

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- HEADER WITH RESET BUTTON ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Filters', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          TextButton(onPressed: resetFilters, child: const Text('Reset', style: TextStyle(color: kPrimary))),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(), // Close without applying
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                              child: const Icon(Icons.close, size: 20, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- WIDGETS NOW READ FROM `currentSettings` ---
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_buildFilterChip('For Sale'), _buildFilterChip('For Rent'), _buildFilterChip('For Buy')]),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildSectionTitle('City'), const SizedBox(height: 8), _buildDropdown(currentSettings.city, cityItems, (val) => setState(() => currentSettings = FilterSettings(type: currentSettings.type, category: currentSettings.category, priceRange: currentSettings.priceRange, city: val, country: currentSettings.country, bedrooms: currentSettings.bedrooms, bathrooms: currentSettings.bathrooms)))])),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildSectionTitle('Country'), const SizedBox(height: 8), _buildDropdown(currentSettings.country, countryItems, (val) => setState(() => currentSettings = FilterSettings(type: currentSettings.type, category: currentSettings.category, priceRange: currentSettings.priceRange, city: currentSettings.city, country: val, bedrooms: currentSettings.bedrooms, bathrooms: currentSettings.bathrooms)))])),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Select Category'),
                  const SizedBox(height: 12),
                  Wrap(spacing: 12.0, runSpacing: 12.0, children: [_buildCategoryChip('All property'), _buildCategoryChip('Trending'), _buildCategoryChip('Apartments'), _buildCategoryChip('House')]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Price Range'),
                  const SizedBox(height: 10),
                  RangeSlider(
                    values: currentSettings.priceRange, min: 0, max: 5000, divisions: 50, activeColor: kPrimary, inactiveColor: kPrimary.withOpacity(0.2),
                    labels: RangeLabels('\$${currentSettings.priceRange.start.round()}', '\$${currentSettings.priceRange.end.round()}'),
                    onChanged: (RangeValues values) => setState(() => currentSettings = FilterSettings(type: currentSettings.type, category: currentSettings.category, priceRange: values, city: currentSettings.city, country: currentSettings.country, bedrooms: currentSettings.bedrooms, bathrooms: currentSettings.bathrooms)),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('\$${currentSettings.priceRange.start.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade600)), Text('\$${currentSettings.priceRange.end.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade600))]),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildSectionTitle('Bed Room'), const SizedBox(height: 8), _buildDropdown(currentSettings.bedrooms, roomItems, (val) => setState(() => currentSettings = FilterSettings(type: currentSettings.type, category: currentSettings.category, priceRange: currentSettings.priceRange, city: currentSettings.city, country: currentSettings.country, bedrooms: val, bathrooms: currentSettings.bathrooms)))])),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildSectionTitle('Bathrooms'), const SizedBox(height: 8), _buildDropdown(currentSettings.bathrooms, bathroomItems, (val) => setState(() => currentSettings = FilterSettings(type: currentSettings.type, category: currentSettings.category, priceRange: currentSettings.priceRange, city: currentSettings.city, country: currentSettings.country, bedrooms: currentSettings.bedrooms, bathrooms: val)))])),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // --- APPLY BUTTON ---
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Return the selected settings when applying
                        Navigator.of(context).pop(currentSettings);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: kPrimary, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      child: const Text('Apply Filters'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}