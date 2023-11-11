import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';
import 'facility.dart'; // Import the Facility model
import 'facility_detail_page.dart'; // Import the FacilityDetailPage
import 'custom_app_bar.dart';
import 'custom_bottom_navigation_bar.dart';

class FacilitiesPage extends StatefulWidget {
  final List<Facility> facilityList;

  FacilitiesPage({required this.facilityList});

  @override
  _FacilitiesPageState createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage> {
  List<Facility> filteredFacilities = [];
  bool isFilterApplied = false;

  @override
  void initState() {
    super.initState();
    filteredFacilities = List.of(widget.facilityList);
  }

  void updateFilteredFacilities(String? filter) {
    if (filter == null) {
      setState(() {
        filteredFacilities = List.of(widget.facilityList);
        isFilterApplied = false; // Clear filter flag
      });
    } else {
      setState(() {
        filteredFacilities = widget.facilityList
          .where((facility) => facility.facilityType == filter)
          .toList();
        isFilterApplied = true; // Filter has been applied
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Facilities'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Facilities',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: LighterPurple,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FilterDropdownButton(
                      facilityList: widget.facilityList,
                      onFilterChanged: updateFilteredFacilities,
                    ),     
                    SizedBox(height: 8),
                    if (isFilterApplied)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Pass null to clear filter
                            updateFilteredFacilities(null);
                          });
                        },
                        child: Text(
                          'Clear Filter',
                          style: TextStyle(
                            color: LighterPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFacilities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FacilityDetailPage(
                          facility: filteredFacilities[index],
                          onDetailPageChanged: (isOnDetailPage) {},
                          // You can pass other necessary data here
                        ),
                      ),
                    );
                  },
                  child: FacilityCard(
                    facility: filteredFacilities[index], 
                    context: context
                  ),
                );
              },
            ),
          ),
        ],
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
    final backgroundColor = Theme.of(context).cardColor;

    final currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now(). day);
    final isSpecialDate = facility.isSpecialDate(currentDate, facility.specialDates);
    final specialWeekName = facility.getSpecialWeekName(currentDate, facility.specialDates);
    final specialOpeningHours = facility.returnSpecialTimeString(currentDate, currentDayOfWeek, facility.specialDates);

    return Card(
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    facility.isOpenNow(context) ? 'Open' : 'Closed',
                    style: TextStyle(
                      fontSize: 16,
                      color: facility.isOpenNow(context) ? Colors.green : Colors.red,
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
    );
  }
}

class FilterDropdownButton extends StatefulWidget {
  final List<Facility> facilityList;
  final ValueChanged<String?> onFilterChanged;

  FilterDropdownButton({
    required this.facilityList,
    required this.onFilterChanged,
  });

  @override
  _FilterDropdownButtonState createState() => _FilterDropdownButtonState();
}

class _FilterDropdownButtonState extends State<FilterDropdownButton> {
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
          color: NorthwesternPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(       
          children: [
            PopupMenuButton<String>(
              icon: Icon(Icons.filter_list, color: Colors.white, size: 24),
              onSelected: (String value) {
                // Implement filtering logic
                setState(() {
                  selectedFilter = value;
                  widget.onFilterChanged(selectedFilter);
                });
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'beach',
                    child: Text(
                      'Beach 🏖️',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  PopupMenuItem(
                    value: 'tennis',
                    child: Text(
                      'Tennis 🎾',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  PopupMenuItem(
                    value: 'basketball',
                    child: Text(
                      'Basketball 🏀',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  PopupMenuItem(
                    value: 'field',
                    child: Text(
                      'Field 🌾',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  PopupMenuItem(
                    value: 'food',
                    child: Text(
                      'Food 🍔',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  PopupMenuItem(
                    value: 'training',
                    child: Text(
                      'Training 🏋️',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  PopupMenuItem(
                    value: 'swimming',
                    child: Text(
                      'Swimming 🌊',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  PopupMenuItem(
                    value: 'baseball',
                    child: Text(
                      'Baseball ⚾',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'wrestling',
                    child: Text(
                      'Wrestling 💪',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'golf',
                    child: Text(
                      'Golf ⛳',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'wellness',
                    child: Text(
                      'Wellness 🏥',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}