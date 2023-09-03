import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'facility.dart';
import 'favorite_facility_notifier.dart';
import 'custom_app_bar.dart';
import 'constants.dart';

class FacilityDetailPage extends StatefulWidget {
  final Facility facility;
  final void Function(bool) onDetailPageChanged;

  FacilityDetailPage({
    required this.facility,
    required this.onDetailPageChanged,
  });

  @override
  _FacilityDetailPageState createState() => _FacilityDetailPageState();
}

class _FacilityDetailPageState extends State<FacilityDetailPage> {
  @override
  void initState() {
    super.initState();
    widget.onDetailPageChanged(true);
  }

  @override
  void dispose() {
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
      appBar: CustomAppBar(title: widget.facility.name),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Consumer<FavoriteFacilityNotifier>(
                    builder: (context, favoriteFacilityNotifier, child) {
                      final isFavorite = favoriteFacilityNotifier.favoriteFacilities.contains(widget.facility.id);

                      void handleFavoriteButtonTap() {
                        favoriteFacilityNotifier.toggleFavorite(widget.facility);
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
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                isFavorite ? 'Favorited' : 'Favorite',
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
                  widget.facility.isOpenNow(context) ? 'Open' : 'Closed',
                  style: TextStyle(
                    fontSize: 24,
                    color: widget.facility.isOpenNow(context) ? Colors.green : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: Text('Tap to view hours'),
                  children: [
                    for (int day = 1; day <= 7; day++)
                      if (widget.facility.openingHours.containsKey(day))
                        ListTile(
                          title: Text(getDayName(day)),
                          subtitle: Text(widget.facility.openingHours[day]!),
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement navigation to the map page
                    },
                    child: Text('See on Map'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
