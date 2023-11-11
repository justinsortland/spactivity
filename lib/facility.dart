import 'package:flutter/material.dart';

class Facility {
  final String id;
  final String name;
  final Map<int, String> openingHours;
  final String image;
  final String googleMapsUrl;
  final String appleMapsUrl;
  final String facilityType;
  final List<String> description;
  final List<String> amenities;

  Facility({
    required this.id,
    required this.name,
    required this.openingHours,
    required this.image,
    required this.googleMapsUrl,
    required this.appleMapsUrl,
    required this.facilityType,
    required this.description,
    required this.amenities,
  });

  String getOpeningHoursForToday() {
    final currentDay = DateTime.now().weekday;
    return openingHours[currentDay] ?? 'Closed';
  }

  bool isOpenNow(context) {
    // Get current day of the week (1: Monday, 2: Tuesday, ... , 7: Sunday)
    final currentDayOfWeek = DateTime.now().weekday;

    // Get current time in HH:mm format
    final currentTime = TimeOfDay.now();

    // Check if gym is open for current day and time
    if (openingHours.containsKey(currentDayOfWeek) && openingHours[currentDayOfWeek] != "CLOSED") {
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

    } else if (openingHours[currentDayOfWeek] == "CLOSED") {
      return false;
    } else {
      // The gym is closed on current day
      return false;
    }
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