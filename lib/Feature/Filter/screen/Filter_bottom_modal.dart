import 'package:family_bottom_sheet/family_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:badi/Core/constants/Colors.dart';

// --- DUMMY DATA FOR DROPDOWNS ---
final List<String> cityItems = ['California', 'New York', 'Texas'];
final List<String> countryItems = ['USA', 'Canada', 'Mexico'];
final List<String> roomItems = ['1 Room', '2 Rooms', '3 Rooms', '4 Rooms'];
final List<String> bathroomItems = ['1 Bathroom', '2 Bathrooms', '3 Bathrooms'];

// --- THE MAIN FUNCTION TO SHOW THE MODAL ---
Future<void> openOptionsModal(BuildContext context) async {
  await FamilyModalSheet.show<void>(
    context: context,
    mainContentPadding: EdgeInsets.zero,
    sheetAnimationStyle: AnimationStyle(),
    contentBackgroundColor: kBackground,
    // Padding is handled inside the builder for more control
  
    builder: (context) {
      // Use StatefulBuilder to manage the state of the filters locally
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          // --- STATE VARIABLES FOR FILTERS ---
          String selectedType = 'For Rent';
          String selectedCategory = 'All property';
          RangeValues _currentRangeValues = const RangeValues(200, 4500);
          String? selectedCity = 'California';
          String? selectedCountry = 'USA';
          String? selectedBedrooms = '4 Rooms';
          String? selectedBathrooms = '2 Bathrooms';

          // Helper function to build the filter chips (For Sale, For Rent, etc.)
          Widget _buildFilterChip(String label) {
            bool isSelected = selectedType == label;
            return ChoiceChip(
              label: Text(label),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => selectedType = label);
                }
              },
              backgroundColor: kBackground,
              selectedColor: kPrimary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            );
          }

          // Helper function to build the category chips (All property, Trending, etc.)
          Widget _buildCategoryChip(String label) {
            bool isSelected = selectedCategory == label;
            return ChoiceChip(
              label: Text(label),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => selectedCategory = label);
                }
              },
              backgroundColor: kBackground,
              selectedColor: kPrimary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontSize: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? kPrimary : Colors.grey.shade300,
                ),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            );
          }

          // A reusable widget for the section titles
          Widget _buildSectionTitle(String title) {
            return Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            );
          }

          // A reusable widget for the custom styled dropdowns
          Widget _buildDropdown(
            String? value,
            List<String> items,
            Function(String?) onChanged,
          ) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  items:
                      items.map<DropdownMenuItem<String>>((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        );
                      }).toList(),
                  onChanged: onChanged,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- HEADER ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            // shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- FILTER TYPE CHIPS ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFilterChip('For Rent'),
                      _buildFilterChip('For Sale'),
                      _buildFilterChip('For Buy'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- LOCATION DROPDOWNS ---
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('City'),
                            const SizedBox(height: 8),
                            _buildDropdown(selectedCity, cityItems, (val) {
                              setState(() => selectedCity = val);
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Country'),
                            const SizedBox(height: 8),
                            _buildDropdown(selectedCountry, countryItems, (
                              val,
                            ) {
                              setState(() => selectedCountry = val);
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- CATEGORY CHIPS ---
                  _buildSectionTitle('Select Category'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      _buildCategoryChip('All property'),
                      _buildCategoryChip('Trending'),
                      _buildCategoryChip('Apartments'),
                      _buildCategoryChip('House'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- PRICE RANGE SLIDER ---
                  _buildSectionTitle('Price Range'),
                  const SizedBox(height: 10),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 5000,
                    divisions: 50,
                    activeColor: kPrimary,
                    inactiveColor: kPrimary.withOpacity(0.2),
                    labels: RangeLabels(
                      '\$${_currentRangeValues.start.round().toString()}',
                      '\$${_currentRangeValues.end.round().toString()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${_currentRangeValues.start.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Text(
                        '\$${_currentRangeValues.end.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- BED/BATHROOM DROPDOWNS ---
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Bed Room'),
                            const SizedBox(height: 8),
                            _buildDropdown(selectedBedrooms, roomItems, (val) {
                              setState(() => selectedBedrooms = val);
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Bathrooms'),
                            const SizedBox(height: 8),
                            _buildDropdown(selectedBathrooms, bathroomItems, (
                              val,
                            ) {
                              setState(() => selectedBathrooms = val);
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // --- APPLY BUTTON ---
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement apply filters logic
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
