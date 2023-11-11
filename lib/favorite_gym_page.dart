import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SPACtivity/favorite_gym_notifier.dart';
import 'gym.dart';

class FavoriteGymPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteGymNotifier = Provider.of<FavoriteGymNotifier>(context, listen: false);
    final gymList = Provider.of<List<Gym>>(context);

    final favoriteGymIDs = favoriteGymNotifier.favoriteGyms;

    final favoriteGymList = gymList
      .where((gym) => favoriteGymIDs.contains(gym.id))
      .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Gyms'),
        backgroundColor: NorthwesternPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Favorite Gyms',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LighterPurple,
              ),
            ),
          ),
          if (favoriteGymList.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You don\'t seem to currently have any favorite gyms!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                     ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'To add your favorite gyms, click the \'Home\' icon at the bottom bar, tap the specific gym you want to favorite, and click the \'Favorite\' button.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          if (favoriteGymList.isNotEmpty) 
            Expanded(
              child: ListView.builder(
                itemCount: favoriteGymList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      favoriteGymList[index].name,
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