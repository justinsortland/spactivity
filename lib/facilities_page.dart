import 'package:flutter/material.dart';
import 'facility.dart'; // Import the Facility model
import 'facility_detail_page.dart'; // Import the FacilityDetailPage
import 'custom_app_bar.dart';
import 'custom_bottom_navigation_bar.dart';

class FacilitiesPage extends StatelessWidget {
  final List<Facility> facilityList;

  FacilitiesPage({required this.facilityList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Facilities'),
      body: ListView.builder(
        itemCount: facilityList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FacilityDetailPage(
                    facility: facilityList[index],
                    onDetailPageChanged: (isOnDetailPage) {

                    },
                    // You can pass other necessary data here
                  ),
                ),
              );
            },
            child: FacilityCard(facility: facilityList[index], context: context),
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
            // Navigate to search page
            Navigator.pushReplacementNamed(context, '/search');
          } else if (index == 2) {
            // Navigate to map page
            Navigator.pushReplacementNamed(context, '/map');
          } else if (index == 3) {
            // Navigate to settings page
            Navigator.pushReplacementNamed(context, '/settings');
          }
        },
      ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final Facility facility;
  final BuildContext context;

  FacilityCard({required this.facility, required this.context});

  @override
  Widget build(BuildContext context) {
    final currentDayOfWeek = DateTime.now().weekday;
    final openingHoursForToday = facility.openingHours[currentDayOfWeek];

    return Card(
      elevation: 0, // Remove gray shadow
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 80,  // Set fixed width for gym image
              height: 80, // Set fixed height for gym image
              child: Image.network(
                facility.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded( // Use Expanded to allow gym name to take up remaining space
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Text(
                    facility.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    facility.isOpenNow(context) ? 'Open' : 'Closed',
                    style: TextStyle(
                      fontSize: 16,
                      color: facility.isOpenNow(context) ? Colors.green : Colors.red,
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