import 'package:badi/model/property_listing_model.dart';
import 'package:badi/views/Home_views/widget/properties_card_widget.dart';
import 'package:flutter/material.dart';

class PropertiesGridviewWidget extends StatefulWidget {
  final List<PropertyListingModel> property;
  const PropertiesGridviewWidget({super.key, required this.property});

  @override
  State<PropertiesGridviewWidget> createState() =>
      _PropertiesGridviewWidgetState();
}

class _PropertiesGridviewWidgetState extends State<PropertiesGridviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 30,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.property.length,
      itemBuilder: (BuildContext context, int index) {
        return PropertiesCardWidget(
          propertyListingModel: widget.property[index],
        );
      },
    );
  }
}
