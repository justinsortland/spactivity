import 'package:SPACtivity/dark_mode_notifier.dart';
import 'package:SPACtivity/favorite_facility_notifier.dart';
import 'package:SPACtivity/text_scale_factor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
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

final List<Gym> gymList = [
  Gym(
    id: '0',
    name: 'Henry Crown Sports Pavilion (SPAC)',
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 11:00 PM',
      2: '6:00 AM - 11:00 PM',
      3: '6:00 AM - 11:00 PM', 
      4: '6:00 AM - 11:00 PM',
      // Friday
      5: '6:00 AM - 10:00 PM',
       // Saturday
      6: '8:00 AM - 9:00 PM',
      // Sunday
      7: '8:00 AM - 10:00 PM',
    },
    image: 'assets/images/spac_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    ]
  ),
  Gym(
    id: '1',
    name: 'Blomquist Recreation Center',
    openingHours: {
      // Monday to Friday
      1: '6:00 AM - 9:00 PM',
      2: '6:00 AM - 9:00 PM',
      3: '6:00 AM - 9:00 PM', 
      4: '6:00 AM - 9:00 PM',
      5: '6:00 AM - 9:00 PM',
      // Saturday and Sunday
      6: '8:00 AM - 6:00 PM',
      7: '8:00 AM - 10:00 PM',
    },
    image: 'assets/images/blomquist_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    ]
  ),
  Gym(
    id: '2',
    name: 'Patten Gymnasium',
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 11:00 PM',
      2: '6:00 AM - 11:00 PM',
      3: '6:00 AM - 11:00 PM', 
      4: '6:00 AM - 11:00 PM',
      // Friday
      5: '6:00 AM - 10:00 PM',
      // Saturday
      6: '8:00 AM - 9:00 PM',
      // Sunday
      7: '8:00 AM - 10:00 PM',
    },
    image: 'assets/images/patten_image.png',
    requiresKeycard: false,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    ]
  ),
  Gym(
    id: '3',
    name: '1838 Chicago Residential Hall',
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 11:00 PM',
      2: '6:00 AM - 11:00 PM',
      3: '6:00 AM - 11:00 PM', 
      4: '6:00 AM - 11:00 PM',
      // Friday
      5: '6:00 AM - 10:00 PM',
      // Saturday
      6: '8:00 AM - 9:00 PM',
      // Sunday
      7: '8:00 AM - 10:00 PM',
    },
    image: 'assets/images/1838_chicago_image.png',
    requiresKeycard: true,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    ]
  ),
  Gym(
    id: '4',
    name: 'Willard Residential Hall',
    openingHours: {
      // Monday to Thursday
      1: '6:00 AM - 11:00 PM',
      2: '6:00 AM - 11:00 PM',
      3: '6:00 AM - 11:00 PM', 
      4: '6:00 AM - 11:00 PM',
      // Friday
      5: '6:00 AM - 10:00 PM',
      // Saturday
      6: '8:00 AM - 9:00 PM',
      // Sunday
      7: '8:00 AM - 10:00 PM',
    },
    image: 'assets/images/willard_image.png',
    requiresKeycard: true,
    equipmentList: [
      Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    ]
  ),
];

final List<Equipment> equipmentList = [
    Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '1', name: '10 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '2', name: '15 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '3', name: '20 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '4', name: '25 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '5', name: '30 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '6', name: '35 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '7', name: '40 lb Dummbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '8', name: '45 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '9', name: '50 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '10', name: '55 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '11', name: '60 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '12', name: '65 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '13', name: '70 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '14', name: '75 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '15', name: 'Treadmill', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
  ];

final List<Facility> facilityList = [
  Facility(
    id: '0', 
    name: 'Protein Bar', 
    openingHours: {
      // Monday to Thursday
      1: '9:00 AM - 7:00 PM',
      2: '9:00 AM - 7:00 PM',
      3: '9:00 AM - 7:00 PM',
      4: '9:00 AM - 7:00 PM',
      // Friday to Saturday
      5: '9:00 AM - 6:00 PM',
      6: '9:00 AM - 6:00 PM',
      // Sunday
      7: '10:00 AM - 5:00 PM',
    },
    image: 'assets/images/protein_bar_image.png',
  ),
];
void main() {
  runApp(
    MultiProvider(
      providers: [
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
    final darkModeNotifier = Provider.of<DarkModeNotifier>(context);
    final isDarkModeEnabled = darkModeNotifier.isDarkModeEnabled;    

    return MultiProvider(
      providers: [
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
              };
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
    // return MaterialApp()
    return Scaffold(
      appBar: CustomAppBar(title: 'SPACtivity'),
      body: ListView.builder(
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
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
    // final currentTime = TimeOfDay.now();
    final currentDayOfWeek = DateTime.now().weekday;
    final openingHoursForToday = gym.openingHours[currentDayOfWeek];
    final textColor = Theme.of(context).textTheme.bodyText1!.color;
    final backgroundColor = Theme.of(context).cardColor;

    return Card(
      elevation: 0, // Remove gray shadow
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 80,  // Set fixed width for gym image
              height: 80, // Set fixed height for gym image
              child: Image.network(
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
                      fontSize: 20, 
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
                  if (openingHoursForToday != null)
                    Text(
                      'Hours today: ${openingHoursForToday}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}