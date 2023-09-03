import 'package:flutter/material.dart';
import 'equipment.dart';

class Gym {
  final String id;
  final String name;
  final Map<int, String> openingHours; // Key: Day of the week (1-7), Value: Opening Hours
  final String image;
  final bool requiresKeycard;
  final List<Equipment> equipmentList;

  Gym({
    required this.id,
    required this.name, 
    required this.openingHours,
    required this.image, 
    required this.requiresKeycard,
    required this.equipmentList
  });

  String getOpeningHoursForToday() {
    // Get current day of the week (1: Monday, 2: Tuesday, ... , 7: Sunday)
    final currentDay = DateTime.now().weekday;

    // Get opening hours for today
    return openingHours[currentDay] ?? 'Closed';
  }

  bool isOpenNow(context) {
    // Get current day of the week (1: Monday, 2: Tuesday, ... , 7: Sunday)
    final currentDay = DateTime.now().weekday;

    // Get current time in HH:mm format
    final currentTime = TimeOfDay.now().format(context);

    // Check if gym is open for current day and time
    if (openingHours.containsKey(currentDay)) {
      final openingHourRange = openingHours[currentDay]!.split(' - ');
      final openingTime = openingHourRange[0];
      final closingTime = openingHourRange[1];

      return currentTime.compareTo(openingTime) >= 0 && currentTime.compareTo(closingTime) <= 0;
    } else {
      // The gym is closed on current day
      return false;
    }
  }

  List<String> getEquipmentNames() {
    return equipmentList.map((equipment) => equipment.name).toList();
  }
}