import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SPACtivity/favorite_facility_notifier.dart';
import 'facility.dart';

class FavoriteFacilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteFacilityNotifier = Provider.of<FavoriteFacilityNotifier>(context, listen: false);
    final facilityList = Provider.of<List<Facility>>(context); // Assuming you have provider for facilityList

    final favoriteFacilityIDs = favoriteFacilityNotifier.favoriteFacilities;

    final favoriteFacilityList = facilityList
        .where((facility) => favoriteFacilityIDs.contains(facility.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Facilities'),
        backgroundColor: NorthwesternPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Favorite Facilities',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LighterPurple,
              ),
            ),
          ),
          if (favoriteFacilityList.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You don\'t seem to currently have any favorite facilities!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                     ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'To add your favorite facilities, click the \'Facilities\' icon at the bottom bar, tap the specific facility you want to favorite, and click the \'Favorite\' button.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          if (favoriteFacilityList.isNotEmpty) 
            Expanded(
              child: ListView.builder(
                itemCount: favoriteFacilityList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      favoriteFacilityList[index].name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    // Add onTap functionality if needed
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}