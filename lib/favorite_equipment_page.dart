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
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}