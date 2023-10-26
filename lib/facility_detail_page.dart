import 'package:SPACtivity/equipment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'facility.dart';
import 'favorite_facility_notifier.dart';
import 'custom_app_bar.dart';
import 'constants.dart';
import 'package:url_launcher/url_launcher.dart';


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

  // Function to open Apple Maps (iOS) or Google Maps (Android)
  void openMaps(Facility facility) async {

    // Debug print to check the appleMapsUrl value
    print('Apple Maps URL: ${facility.appleMapsUrl}');
    // Debug print to check the appleMapsUrl value
    print('Google Maps URL: ${facility.googleMapsUrl}');

    // URL for Apple Maps (iOS)
    final appleMapsUrl = facility.appleMapsUrl;

    // URL for Google Maps (Android)
    final googleMapsUrl = facility.googleMapsUrl;

    if (await canLaunch(appleMapsUrl)) {
      await launch(appleMapsUrl);
    } else if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch maps';
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
                          height: 48,
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
                                isFavorite 
                                ? 'Favorited' 
                                : 'Favorite',
                                style: TextStyle(
                                  fontSize: 18,
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
                    fontWeight: FontWeight.bold,
                    color: widget.facility.isOpenNow(context) ? Colors.green : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: Text(
                    'Tap to view hours',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    for (int day = 1; day <= 7; day++)
                      if (widget.facility.openingHours.containsKey(day))
                        ListTile(
                          title: Text(
                            getDayName(day),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            widget.facility.openingHours[day]!,
                            style: TextStyle(fontSize: 16),
                          ),
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        ),
                  ],
                ),
                SizedBox(height: 16),
                Center( // Center the "See on Map" button
                  child: ElevatedButton(
                    onPressed: () {
                      openMaps(widget.facility);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NorthwesternPurple,
                    ),
                    child: Text(
                      'See on Map',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
