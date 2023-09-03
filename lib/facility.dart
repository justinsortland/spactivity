import 'package:flutter/material.dart';

class Facility {
  final String id;
  final String name;
  final Map<int, String> openingHours;
  final String image;

  Facility({
    required this.id,
    required this.name,
    required this.openingHours,
    required this.image,
  });

  String getOpeningHoursForToday() {
    final currentDay = DateTime.now().weekday;
    return openingHours[currentDay] ?? 'Closed';
  }

  bool isOpenNow(context) {
    final currentDay = DateTime.now().weekday;
    final currentTime = TimeOfDay.now().format(context);

    if (openingHours.containsKey(currentDay)) {
      final openingHourRange = openingHours[currentDay]!.split(' - ');
      final openingTime = openingHourRange[0];
      final closingTime = openingHourRange[1];

      return currentTime.compareTo(openingTime) >= 0 && currentTime.compareTo(closingTime) <= 0;   
    } else {
      return false;
    }
  }
}