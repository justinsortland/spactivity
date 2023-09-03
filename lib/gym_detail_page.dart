import 'package:SPACtivity/constants.dart';
import 'package:SPACtivity/equipment_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gym.dart';
import 'favorite_gym_notifier.dart';
import 'custom_app_bar.dart';

class GymDetailPage extends StatefulWidget {
  final Gym gym;
  final void Function(bool) onDetailPageChanged;


  GymDetailPage({
    required this.gym, 
    required this.onDetailPageChanged
  });

  @override
  _GymDetailPageState createState() => _GymDetailPageState();
}

class _GymDetailPageState extends State<GymDetailPage> {

  @override
  void initState() {
    super.initState();

    // Notify search page about detail page status
    widget.onDetailPageChanged(true);
  }

  @override
  void dispose() {
    // Notify search page that detail page is closed
    widget.onDetailPageChanged(false);
    super.dispose();
  }

  String getDayName(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Unknown Day';
    }
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: CustomAppBar(title: widget.gym.name),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Consumer<FavoriteGymNotifier>(
                    builder: (context, favoriteGymNotifier, child) {
                      final isFavorite = favoriteGymNotifier.favoriteGyms.contains(widget.gym.id);
                                      
                      void handleFavoriteButtonTap() {
                        favoriteGymNotifier.toggleFavorite(widget.gym);
                        // setState(() {});
                      }

                      return InkWell(
                        onTap: handleFavoriteButtonTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: NorthwesternPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isFavorite 
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                isFavorite 
                                  ? 'Favorited' 
                                  : 'Favorite',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  widget.gym.isOpenNow(context) ? 'Open' : 'Closed',
                  style: TextStyle(
                    fontSize: 24,
                    color: widget.gym.isOpenNow(context) ? Colors.green : Colors.red, // Use green for "Open" and red for "Closed"
                  ), // Increase font size here
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: Text('Tap to view hours'),
                  children: [
                    for (int day = 1; day <= 7; day++)
                      if (widget.gym.openingHours.containsKey(day))
                        ListTile(
                          title: Text(
                            getDayName(day),
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            widget.gym.openingHours[day]!,
                            style: TextStyle(fontSize: 16),
                          ),
                          dense: true, // Make the ListTile elements smaller
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16), // Adjust padding
                        ),
                  ],
                ),
                SizedBox(height: 16),
                Center( // Center the "See on Map" button
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement navigation to the map page
                    },
                    child: Text('See on Map'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Traffic',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // TODO: Add traffic information here

                // Equipment section
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Equipment',
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.gym.equipmentList.map((equipment) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentDetailPage(
                              equipment: equipment, 
                              onDetailPageChanged: (isOnDetailPage) {},
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          equipment.name,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}