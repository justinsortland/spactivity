import 'package:flutter/material.dart';
import 'equipment.dart';

class Gym {
  final String id;
  final String name;
  final Map<int, String> openingHours; // Key: Day of the week (1-7), Value: Opening Hours
  final String image;
  final bool requiresKeycard;
  final List<Equipment> equipmentList;
  final String googleMapsUrl;
  final String appleMapsUrl;

  Gym({
    required this.id,
    required this.name, 
    required this.openingHours,
    required this.image, 
    required this.requiresKeycard,
    required this.equipmentList,
    required this.googleMapsUrl,
    required this.appleMapsUrl,
  });

  bool isOpenNow(context) {
    // Get current day of the week (1: Monday, 2: Tuesday, ... , 7: Sunday)
    final currentDayOfWeek = DateTime.now().weekday;

    // Get current time in HH:mm format
    final currentTime = TimeOfDay.now();

    // Check if gym is open for current day and time
    if (openingHours.containsKey(currentDayOfWeek)) {
      final openingHourRange = openingHours[currentDayOfWeek]!.split(' - ');
      final openingTime = _parseTimeOfDay(openingHourRange[0]);
      final closingTime = _parseTimeOfDay(openingHourRange[1]);

      final currentTimeAsDateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        currentTime.hour,
        currentTime.minute,
      );

      return currentTimeAsDateTime.isAfter(openingTime) && currentTimeAsDateTime.isBefore(closingTime);
    } else {
      // The gym is closed on current day
      return false;
    }
  }

  List<String> getEquipmentNames() {
    return equipmentList.map((equipment) => equipment.name).toList();
  }

  DateTime _parseTimeOfDay(String timeStr) {
    final timeParts = timeStr.split(' ');
    final time = timeParts[0];
    final isPM = timeParts[1] == 'PM';

    final parts = time.split(':');
    var hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    if (isPM && hour != 12) {
      hour += 12;
    } else if (!isPM && hour == 12) {
      hour = 0;
    }

    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hour,
      minute,
    );
  }
}