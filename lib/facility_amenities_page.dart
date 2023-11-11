import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_app_bar.dart';
import 'facility.dart';

class FacilityAmenitiesPage extends StatelessWidget {
  final Facility facility;

  FacilityAmenitiesPage({required this.facility});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: facility.name),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Amenities',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LighterPurple,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: facility.amenities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    facility.amenities[index],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}