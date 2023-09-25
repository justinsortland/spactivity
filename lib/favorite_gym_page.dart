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
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteGymNotifier.favoriteGyms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    favoriteGymList[index].name,
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