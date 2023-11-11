import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SPACtivity/favorite_equipment_notifier.dart';
import 'equipment.dart';

class FavoriteEquipmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteEquipmentNotifier = Provider.of<FavoriteEquipmentNotifier>(context, listen: false);
    final equipmentList = Provider.of<List<Equipment>>(context); // Assuming you have provider for equipmentList

    final favoriteEquipmentIDs = favoriteEquipmentNotifier.favoriteEquipment;

    // Get list of favorite equipment
    final favoriteEquipmentList = equipmentList
      .where((equipment) => favoriteEquipmentIDs.contains(equipment.id))
      .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Equipment'),
        backgroundColor: NorthwesternPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Favorite Equipment',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LighterPurple,
              ),
            ),
          ),
          if (favoriteEquipmentList.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You don\'t seem to currently have any favorite equipment!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                     ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'To add your favorite equipment or machine, click the \'Search\' icon at the bottom bar, tap the specific equipment or machine you want to favorite, and click the \'Favorite\' button.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          if (favoriteEquipmentList.isNotEmpty) 
            Expanded(
              child: ListView.builder(
                itemCount: favoriteEquipmentList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      favoriteEquipmentList[index].name,
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