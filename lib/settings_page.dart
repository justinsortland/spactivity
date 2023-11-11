import 'package:SPACtivity/constants.dart';
import 'package:SPACtivity/favorite_equipment_notifier.dart';
import 'package:SPACtivity/more_info_dialog_content.dart';
import 'favorite_facility_notifier.dart';
import 'favorite_gym_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_app_bar.dart';
import 'package:SPACtivity/custom_bottom_navigation_bar.dart';
import 'about_us_page.dart';
import 'dark_mode_notifier.dart';

class SettingsPage extends StatelessWidget {
  void _showMoreInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: MoreInfoDialogContent(),
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final darkModeNotifier = Provider.of<DarkModeNotifier>(context);
    final favoriteEquipmentNotifier = Provider.of<FavoriteEquipmentNotifier>(context);
    final favoriteFacilityNotifier = Provider.of<FavoriteFacilityNotifier>(context);
    final favoriteGymNotifier = Provider.of<FavoriteGymNotifier>(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold,
                  color: LighterPurple,
                ),
              ),
              SizedBox(height: 8),
              Divider(),
              InkWell(
                onTap: () {
                  // Implement action for "About Us" button
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'About Us',
                      style: TextStyle(fontSize: 18)
                    ),
                  ),
                ),  
              ),
              Divider(),
              InkWell(
                onTap: () {
                  // Implement action for "More Info" button
                  _showMoreInfoDialog(context);
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'More Info',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 8),
                  Switch(
                    value: darkModeNotifier.isDarkModeEnabled,
                    onChanged: (newValue) {
                      darkModeNotifier.isDarkModeEnabled = newValue;
                    }
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Favorite Pages', // Placeholder for favorite foods heading
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: LighterPurple,
                ),   
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  InkWell(
                    onTap: () {
                      // Navigation to favorite equipment page
                      Navigator.pushNamed(
                        context, 
                        '/favorite_equipment',
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Favorite Equipment',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      // Navigation to favorite gyms
                      Navigator.pushNamed(
                        context, 
                        '/favorite_gyms',
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Favorite Gyms',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      // Navigation to favorite facilities
                      Navigator.pushNamed(
                        context,
                        '/favorite_facilities',
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Favorite Facilities',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 48),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Clear favorites and cache
                      favoriteEquipmentNotifier.clearFavorites();
                      favoriteFacilityNotifier.clearFavorites();
                      favoriteGymNotifier.clearFavorites();
                      PaintingBinding.instance.imageCache.clear();

                      // Show notification
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Cache cleared!',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NorthwesternPurple,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text(
                      'Clear Cache',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3, 
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/search');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/map');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/settings');
          }
        },
      ),
    );
  }
}