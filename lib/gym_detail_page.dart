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
  // Define some sample data for the bar graph (you can replace this with actual data)
  List<BarChartGroupData> generateBarChartData(Gym gym, int currentDay) {
    final List<BarChartGroupData> barChartData = [];
    
    if (gym.openingHours.containsKey(currentDay)) {
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

      // Loop throuh each hour the gym is open on the current day
      for (var hour = 0; hour <= totalHours; hour++) {
        final isCurrentHour = currentTime.hour == (openingTime.hour + hour);
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
    }
    return barChartData;
  }

  int getRandomTrafficValue() {
    // Replace this with logic to get actual traffic data for each hour
    return Random().nextInt(10) + 1;
  }

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
    final currentDate = DateTime.now();
    final currentDay = currentDate.weekday;

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
                      if (widget.gym.openingHours.containsKey(day))
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
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Traffic',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // TODO: Add traffic information here
                SizedBox(height: 16),
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
                            if (widget.gym.openingHours.containsKey(currentDay)) {
                              final openingHours = widget.gym.openingHours[currentDay]!.split(' - ');
                              final openingTime = DateFormat.jm().parse(openingHours[0]);
                              final closingTime = DateFormat.jm().parse(openingHours[1]);

                              final List<String> timeLabels = [];
                              for (var hour = openingTime.hour; hour <= closingTime.hour; hour += 3) {
                                final hour12Format = hour % 12 == 0 ? 12 : hour % 12;
                                final period = hour < 12 ? 'AM' : 'PM';
                                final time = '$hour12Format $period';
                                timeLabels.add(time);
                              }
          
                              // Calculate corresponding index for current value
                              final index = (value ~/ 3).toInt();

                              if (index >= 0 && index < timeLabels.length) {
                                return timeLabels[index];
                              }
                            }
                            return '';
                          },
                          margin: 8,
                          interval: 3,
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
                      barGroups: generateBarChartData(widget.gym, currentDay),
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
                ),
                // Equipment section
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Equipment',
                    style: TextStyle(
                      fontSize: 24, 
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
                            fontSize: 18,
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