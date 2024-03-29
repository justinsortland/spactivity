import 'package:SPACtivity/constants.dart';
import 'package:SPACtivity/equipment_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gym.dart';
import 'favorite_gym_notifier.dart';
import 'custom_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'gym_amenities_page.dart';
import 'gym_equipment_page.dart';

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
  // Define variable to store selected day of the week
  int selectedDay = DateTime.now().weekday;

  // Initialize list for bar chart data
  final Map<int, List<BarChartGroupData>> dayDataMap = {};

  // Define some sample data for the bar graph (you can replace this with actual data)
  List<BarChartGroupData> generateBarChartData(Gym gym, int currentDay) {
    final List<BarChartGroupData> barChartData = [];

    final currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (gym.isSpecialDate(currentDate, gym.specialDates)) {
      final specialWeekName = gym.getSpecialWeekName(currentDate, gym.specialDates);
      final specialTimeString = gym.returnSpecialTimeString(currentDate, currentDay, gym.specialDates);
      if (specialTimeString != "CLOSED" && specialTimeString != "Open 24 Hours") {
        final specialOpeningHours = specialTimeString!.split(' - ');

        final openingTime = DateFormat.jm().parse(specialOpeningHours![0]);
        final closingTime = DateFormat.jm().parse(specialOpeningHours![1]);
        final currentTime = DateTime.now();

        // Calculate total hours gym is open
        final int totalHours = closingTime.hour - openingTime.hour;
        print('openingTime.hour: ${openingTime.hour}');
        print('closingTime.hour: ${closingTime.hour}');
        print('totalHours: $totalHours');


        // Create list of time labels with 3-hour intervals
        final List<String> timeLabels = [];
        for (var hour = openingTime.hour; hour <= closingTime.hour; hour += 3) {
          final time = hour % 12 == 0 ? '12 AM' : (hour % 12).toString() + (hour < 12 ? 'AM' : 'PM');
          timeLabels.add(time);
        } 

        // Loop through each hour the gym is open on the current day
        for (var hour = 0; hour <= totalHours; hour++) {
          final isCurrentHour = currentTime.hour == (openingTime.hour + hour) - 1;
          final barGroupData = BarChartGroupData(
            x: hour,
            barRods: [
              BarChartRodData(
                y: getRandomTrafficValue().toDouble(),
                colors: [isCurrentHour ? Colors.red : Colors.blue],
                width: 16,
              ),
            ],
          );
          barChartData.add(barGroupData);
        }
      } else {
        // For "CLOSED" case, add empty bars (none of the 24 hour gyms have swipe-in data)
        // Create list of time labels with 3-hour intervals
        final List<String> timeLabels = [];
        for (var hour = 6; hour <= 26; hour += 3) {
          final time = hour % 12 == 0 ? '12 AM' : (hour % 12).toString() + (hour < 12 ? 'AM' : 'PM');
          timeLabels.add(time);
        } 

        for (var hour = 0; hour <= 20; hour++) {
          final barGroupData = BarChartGroupData(
            x: hour,
            barRods: [
              BarChartRodData(
                y: 0.0, // No traffic data
                colors: [Colors.transparent], // Transparent color for empty bars
                width: 16,
              ),
            ],
          );
          barChartData.add(barGroupData);
        }
      }
    } else if (gym.openingHours.containsKey(currentDay) && gym.openingHours[currentDay] != 'CLOSED' && gym.openingHours[currentDay] != 'Open 24 Hours') {
      final openingHours = gym.openingHours[currentDay]!.split(' - ');
      final openingTime = DateFormat.jm().parse(openingHours[0]);
      final closingTime = DateFormat.jm().parse(openingHours[1]);
      final currentTime = DateTime.now();

      // Calculate total hours gym is open
      final int totalHours = closingTime.hour - openingTime.hour;

      // Create list of time labels with 3-hour intervals
      final List<String> timeLabels = [];
      for (var hour = openingTime.hour; hour <= closingTime.hour; hour += 3) {
        final time = hour % 12 == 0 ? '12 AM' : (hour % 12).toString() + (hour < 12 ? 'AM' : 'PM');
        timeLabels.add(time);
      } 

      // Loop through each hour the gym is open on the current day
      for (var hour = 0; hour <= totalHours; hour++) {
        final isCurrentHour = currentTime.hour == (openingTime.hour + hour) - 2;
        // final isCurrentHour = currentTime.hour == hour;
        final barGroupData = BarChartGroupData(
          x: hour,
          barRods: [
            BarChartRodData(
              y: getRandomTrafficValue().toDouble(),
              colors: [isCurrentHour ? Colors.red : Colors.blue],
              width: 16,
            ),
          ],
        );
        barChartData.add(barGroupData);
      }
    } else {
      // For "CLOSED" case, add empty bars (none of the 24 hour gyms have swipe-in data)

      // Create list of time labels with 3-hour intervals
      final List<String> timeLabels = [];
      for (var hour = 6; hour <= 20; hour += 3) {
        final time = hour % 12 == 0 ? '12 AM' : (hour % 12).toString() + (hour < 12 ? 'AM' : 'PM');
        timeLabels.add(time);
      } 

      for (var hour = 6; hour <= 20; hour += 3) {
        final barGroupData = BarChartGroupData(
          x: hour - 6,
          barRods: [
            BarChartRodData(
              y: 0.0, // No traffic data
              colors: [Colors.transparent], // Transparent color for empty bars
              width: 16,
            ),
          ],
        );
        barChartData.add(barGroupData);
      }
    }

    return barChartData;
  }

  List<BarChartGroupData> calculateWeeklyData() {
    final weeklyData = List<BarChartGroupData>.filled(
      7,
      BarChartGroupData(x: 0, barRods: [BarChartRodData(y: 0.0)]),
    );

    final currentDayOfWeek = DateTime.now().weekday;
    for (int day = 1; day <= 7; day++) {
      double sum = 0.0;

      if (dayDataMap.containsKey(day)) {
        final dayData = dayDataMap[day]!;
        for (final groupData in dayData) {
          // Add bar heights to the corresponding day of the week
          sum += groupData.barRods[0].y;
        }
      }

      // Calculate average by dividing sum by 24 (assuming 24 hours in a day)
      weeklyData[day - 1] = BarChartGroupData(
        x: day - 1,
        barRods: [
          BarChartRodData(
          y: sum / 16,
          width: 16,
          colors: [currentDayOfWeek == day ? Colors.red : Colors.blue],
          ),
        ],
      );
    }
    return weeklyData;
  }

  int getRandomTrafficValue() {
    // Replace this with logic to get actual traffic data for each hour
    return Random().nextInt(10) + 1;
  }

  String getTimeLabelForIndex(int index) {
    final openingHours = widget.gym.openingHours[DateTime.now().weekday]!.split(' - ');
    final openingTime = DateFormat.jm().parse(openingHours[0]);

    List<String> timeLabels = ['6 AM', '9 AM', '12 PM', '3 PM', '6 PM', '9 PM', '12 AM'];
    if (openingTime.hour == 6) {
      timeLabels = ['6 AM', '9 AM', '12 PM', '3 PM', '6 PM', '9 PM', '12 AM'];
    } else if (openingTime.hour == 7) {
      timeLabels = ['7 AM', '10 AM', '1 PM', '4 PM', '7 PM', '10 PM', '1 AM'];
    } else {
      timeLabels = ['8 AM', '11 AM', '12 PM', '5 PM', '8 PM', '11 PM', '2 AM'];
    } 

    if (index >= 0 && index < timeLabels.length) {
      return timeLabels[index];
    }
    return '';
  }

  void navigateToAmenitiesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GymAmenitiesPage(gym: widget.gym),
      ),
    );
  }

  void navigateToEquipmentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GymEquipmentPage(gym: widget.gym),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Generate data for all days of the week
    for (int day = 1; day <= 7; day++) {
      dayDataMap[day] = generateBarChartData(widget.gym, day);
    }

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

  // Function to open Apple Maps (iOS) or Google Maps (Android)
  void openMaps(Gym gym) async {

    // Debug print to check the appleMapsUrl value
    print('Apple Maps URL: ${gym.appleMapsUrl}');
    // Debug print to check the appleMapsUrl value
    print('Google Maps URL: ${gym.googleMapsUrl}');

    // URL for Apple Maps (iOS)
    final appleMapsUrl = gym.appleMapsUrl;

    // URL for Google Maps (Android)
    final googleMapsUrl = gym.googleMapsUrl;

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
    final currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final currentDay = currentDate.weekday;

    final isSpecialDate = widget.gym.isSpecialDate(currentDate, widget.gym.specialDates);
    final specialWeekName = widget.gym.getSpecialWeekName(currentDate, widget.gym.specialDates);

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
                          height: 48,
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
                  widget.gym.isOpenNow(context) ? 'Open' : 'Closed',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: widget.gym.isOpenNow(context) ? Colors.green : Colors.red, // Use green for "Open" and red for "Closed"
                  ), // Increase font size here
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
                      if (!isSpecialDate && widget.gym.openingHours.containsKey(day))
                        ListTile(
                          title: Text(
                            getDayName(day),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            widget.gym.openingHours[day]!,
                            style: TextStyle(fontSize: 16),
                          ),
                          dense: true, // Make the ListTile elements smaller
                          contentPadding: EdgeInsets.symmetric(horizontal: 16), // Adjust padding
                        ),
                    for (int day = 1; day <= 7; day++)
                      if (isSpecialDate)
                        ListTile(
                          title: Text(
                            getDayName(day),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            widget.gym.specialOpeningHours[specialWeekName]?[day] ?? "",
                            style: TextStyle(fontSize: 16),
                          ),
                          dense: true, // Make the ListTile elements smaller
                          contentPadding: EdgeInsets.symmetric(horizontal: 16), // Adjust padding
                        ),
                  ],
                ),
                SizedBox(height: 16),
                Center( // Center the "See on Map" button
                  child: ElevatedButton(
                    onPressed: () {
                      openMaps(widget.gym);
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
                if (widget.gym.hasSwipeIn)
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      'Traffic',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: LighterPurple,
                      ),
                    ),
                  ),
                if (widget.gym.hasSwipeIn)
                  Padding(
                    padding:EdgeInsets.only(top: 8),
                    child: Text(
                      'Choose the day of the week which corresponds to the daily traffic you would like to see. Choose "Weekly" to see the overall traffic for each day of the week.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                SizedBox(height: 8),
                // Dropdown button for selecting the day of the week
                if (widget.gym.hasSwipeIn)
                  DropdownButton<int>(
                    value: selectedDay, 
                    onChanged: (int? newValue) {
                        setState(() {
                          selectedDay = newValue!;
                        });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem<int>(
                        value: 1, // Monday
                        child: Text(
                          'Monday',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 2, // Tuesday
                        child: Text(
                          'Tuesday',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 3, // Wednesday
                        child: Text(
                          'Wednesday',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 4, // Thursday
                        child: Text(
                          'Thursday',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 5, // Friday
                        child: Text(
                          'Friday',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 6, // Saturday
                        child: Text(
                          'Saturday',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 7, // Sunday
                        child: Text(
                          'Sunday',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 8, // Weekly
                        child: Text(
                          'Weekly',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                // TODO: Add traffic information here
                SizedBox(height: 16),
                if (widget.gym.hasSwipeIn)            
                  AspectRatio(
                    aspectRatio: 1.7,
                    child: BarChart(
                      BarChartData(
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: true,
                          drawVerticalLine: true,
                          horizontalInterval: 3.0,
                          verticalInterval: 1.0,
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 32,
                            interval: 1,
                          ),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTitles: (double value) {
                              if (selectedDay == 8) {
                                
                                // Display days (Mon, Tue, Wed, etc.) for weekly view
                                final List<String> dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                                final index = value.toInt();
                                if (index >= 0 && index < dayLabels.length) {
                                  return dayLabels[index];
                                }
                              } else if (dayDataMap.containsKey(selectedDay)) {
                                // Display times (7 AM, 8 AM, 9 AM, etc.) for individual days
                                final List<BarChartGroupData> dayData = dayDataMap[selectedDay]!;
                                final index = (value / 3).toInt();
                                if (index >= 0 && index < dayData.length) {
                                  final barGroup = dayData[index];
                                  final timeLabel = getTimeLabelForIndex(barGroup.x);
                                  return timeLabel;
                                }
                              }
                              return '';
                            },
                            margin: 8,
                            interval: selectedDay == 8 ? 1 : 3,
                          ),
                          rightTitles: SideTitles(showTitles: false),
                          topTitles: SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            left: BorderSide(
                              color: Colors.grey[800]!,
                              width: 1.0,
                            ),
                            right: BorderSide.none,
                            top: BorderSide.none,
                          ),
                        ),
                        barGroups: selectedDay == 8 ? calculateWeeklyData() : dayDataMap[selectedDay] ?? [],
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.blueGrey,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                rod.y.toString(),
                                TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),  // Equipment section
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: LighterPurple,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.gym.description
                      .map((item) => Column(
                            children: [
                              Text(
                                item,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 12),
                            ]
                          ))
                        .toList(),
                  ),
                ),
                if (widget.gym.equipmentList.isNotEmpty)
                  Center( // Center the "View Equipment" button
                    child: ElevatedButton(
                      onPressed: () {
                        navigateToEquipmentPage(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NorthwesternPurple,
                      ),
                      child: Text(
                        'View Equipment',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (widget.gym.amenities.isNotEmpty)
                  SizedBox(height: 16),
                if (widget.gym.amenities.isNotEmpty)
                  Center( // Center the "View Amenities" button
                    child: ElevatedButton(
                      onPressed: () {
                        navigateToAmenitiesPage(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NorthwesternPurple,
                      ),
                      child: Text(
                        'View Amenities',
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