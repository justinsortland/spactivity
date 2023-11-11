import 'package:SPACtivity/constants.dart';
import 'package:SPACtivity/dark_mode_notifier.dart';
import 'package:SPACtivity/list_of_facilities.dart';
import 'package:SPACtivity/favorite_facility_notifier.dart';
import 'package:SPACtivity/text_scale_factor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gym_detail_page.dart';
import 'gym.dart';
import 'custom_app_bar.dart';
import 'custom_bottom_navigation_bar.dart';
import 'search_page.dart'; 
import 'settings_page.dart';
import 'equipment.dart';
import 'equipment_detail_page.dart';
import 'favorite_gym_notifier.dart';
import 'favorite_facility_page.dart';
import 'favorite_equipment_notifier.dart';
import 'favorite_equipment_page.dart';
import 'favorite_gym_page.dart';
import 'facilities_page.dart';
import 'facility.dart';
import 'facility_detail_page.dart';
import 'list_of_gyms.dart';
import 'list_of_equipment.dart';
import 'list_of_dates.dart';
import 'page_navigation_notifier.dart';

// Initialize lists 
final List<Gym> gymList = ListOfGyms;
final List<Equipment> equipmentList = ListOfEquipment;
final List<Facility> facilityList = ListOfFacilities;

void main()  {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageNavigationNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteEquipmentNotifier(),
        ),
        Provider<List<Equipment>>(
          create: (context) => equipmentList,
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteGymNotifier(),
        ),
        Provider<List<Gym>>(
          create: (context) => gymList,
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteFacilityNotifier(),
        ),
        Provider<List<Facility>>(
          create: (context) => facilityList,
        ),
        ChangeNotifierProvider(
          create: (context) => DarkModeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextScaleFactorNotifier(),
        ),
      ],
      child: SPACtivityApp(),   
    ),
  );
}

class SPACtivityApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageNavigationNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteEquipmentNotifier(),
        ),
        Provider<List<Equipment>>(
          create: (context) => equipmentList,
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteGymNotifier(),
        ),
        Provider<List<Gym>>(
          create: (context) => gymList,
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteFacilityNotifier(),
        ),
        Provider<List<Facility>>(
          create: (context) => facilityList,
        ),
        ChangeNotifierProvider(
          create: (context) => DarkModeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextScaleFactorNotifier(),
        ),
      ],
      child: Consumer<DarkModeNotifier>(
        builder: (context, darkModeNotifier, child) {
          final isDarkModeEnabled = darkModeNotifier.isDarkModeEnabled;
          return MaterialApp(
            title: 'SPACtivity',
            theme: isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),

            // home: HomePage(gyms: gyms),
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(gymList: gymList),
              '/facilities' : (context) => FacilitiesPage(facilityList: facilityList),
              '/search': (context) => SearchPage(),
              '/settings': (context) => SettingsPage(),
              '/favorite_equipment': (context) => FavoriteEquipmentPage(),
              '/favorite_gyms': (context) => FavoriteGymPage(),
              '/favorite_facilities': (context) => FavoriteFacilityPage(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == '/gymDetail') {
                final Gym gym = settings.arguments as Gym;
                return MaterialPageRoute(
                  builder: (context) => GymDetailPage(
                    gym: gym, 
                    onDetailPageChanged: (isOnDetailPage) {}),
                );
              } else if (settings.name == '/equipmentDetail') {
                final Equipment equipment = settings.arguments as Equipment;
                return MaterialPageRoute(
                  builder: (context) => EquipmentDetailPage(
                    equipment: equipment,
                    onDetailPageChanged: (isOnDetailPage) {},),
                );
              } else if (settings.name == '/facilityDetail') {
                final Facility facility = settings.arguments as Facility;
                return MaterialPageRoute(
                  builder: (context) => FacilityDetailPage(
                    facility: facility,
                    onDetailPageChanged: (isOnDetailPage) {}),
                );
              }
              // Handle other name routes here, if needed
              return null;
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  final List<Gym> gymList;

  HomePage({required this.gymList});


  @override
  Widget build(BuildContext context) {
    final pageNavigationNotifier = Provider.of<PageNavigationNotifier>(context);
    // return MaterialApp()
    return Scaffold(
      appBar: CustomAppBar(title: 'SPACtivity'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Gyms',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LighterPurple,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gymList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GymDetailPage(
                          gym: gymList[index], 
                          onDetailPageChanged: (isOnDetailPage) {

                          },
                        ),
                      ),
                    );
                  },
                  child: GymCard(gym: gymList[index], context: context),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: pageNavigationNotifier.currentIndex,
        onTap: (index) async {
          pageNavigationNotifier.setIndex(index);
          // Implement navigation to other pages based on index
          if (index == 0) {
            // Navigate to home page
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            // Navigate to facilities page
            Navigator.pushReplacementNamed(context, '/facilities');
          } else if (index == 2) {
            // Navigate to search page
            Navigator.pushReplacementNamed(context, '/search');
          } else if (index == 3) {
            // Navigate to settings page
            Navigator.pushReplacementNamed(context, '/settings');
          }

          await Future.delayed(Duration(milliseconds: 300));
          pageNavigationNotifier.setIndex(index);
        },
      ),
    );
  }
}

class GymCard extends StatelessWidget {
  final Gym gym;
  final BuildContext context;

  GymCard({required this.gym, required this.context});

  @override
  Widget build(BuildContext context) {
    final currentDayOfWeek = DateTime.now().weekday;
    final openingHoursForToday = gym.openingHours[currentDayOfWeek];
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final backgroundColor = Theme.of(context).cardColor;

    final currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now(). day);
    final isSpecialDate = gym.isSpecialDate(currentDate, gym.specialDates);
    final specialWeekName = gym.getSpecialWeekName(currentDate, gym.specialDates);
    final specialOpeningHours = gym.returnSpecialTimeString(currentDate, currentDayOfWeek, gym.specialDates);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Card(
        elevation: 0, // Remove gray shadow
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 80,  // Set fixed width for gym image
                height: 80, // Set fixed height for gym image
                child: Image.asset(
                  gym.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded( // Use Expanded to allow gym name to take up remaining space
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Text(
                      gym.name,
                      style: TextStyle(
                        fontSize: 22, 
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      gym.isOpenNow(context) ? 'Open' : 'Closed',
                      style: TextStyle(
                        fontSize: 16,
                        color: gym.isOpenNow(context) ? Colors.green : Colors.red,
                      ),
                    ),
                    if (isSpecialDate && openingHoursForToday != null)
                      Text(
                        'Hours today: $specialOpeningHours',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    // Otherwise, output normal hours
                    if (!isSpecialDate && openingHoursForToday != null)
                      Text(
                        'Hours today: $openingHoursForToday',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}