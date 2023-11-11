import 'package:SPACtivity/special_opening_hours.dart';
import 'package:flutter/material.dart';
import 'equipment.dart';
import 'list_of_dates.dart';

class Gym {
  final String id;
  final String name;
  final Map<int, String> openingHours; // Key: Day of the week (1-7), Value: Opening Hours
  final Map<String, Map<int, String>> specialOpeningHours;
  final List<List<DateTime>> specialDates;
  final String image;
  final bool requiresKeycard;
  final List<Equipment> equipmentList;
  final String googleMapsUrl;
  final String appleMapsUrl;
  final bool hasSwipeIn;
  final List<String> description;
  final List<String> amenities;

  Gym({
    required this.id,
    required this.name, 
    required this.openingHours,
    required this.specialOpeningHours,
    required this.specialDates,
    required this.image, 
    required this.requiresKeycard,
    required this.equipmentList,
    required this.googleMapsUrl,
    required this.appleMapsUrl,
    required this.hasSwipeIn,
    required this.description,
    required this.amenities,
  });

  bool isOpenNow(context) {

    // Get current day of the week (1: Monday, 2: Tuesday, ... , 7: Sunday)
    final currentDayOfWeek = DateTime.now().weekday;

    // Get current time in HH:mm format
    final currentTime = TimeOfDay.now();

    // Get current date 
    final currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    // Check if current date is within any special period
    if (isSpecialDate(currentDate, specialDates)) {
      // Use special opening hours for current gym
      final currentSpecialWeekName = getSpecialWeekName(currentDate, specialDates);
      return isSpecialDateOpen(currentDate, currentDayOfWeek, currentSpecialWeekName);
    } else {
      // Use regular opening hours
      if (openingHours.containsKey(currentDayOfWeek) && openingHours[currentDayOfWeek] != "Open 24 Hours") {
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
        // The gym is closed on current day
        return false;
      } else if (openingHours[currentDayOfWeek] == "Open 24 Hours") {
        return true;
      } else {
        return false;
      } 
    }
  }  

  String getSpecialWeekName(DateTime currentDate, List<List<DateTime>> specialDates) {
    for (var i = 0; i < specialDates.length; i++) {
      if (specialDates[i].contains(currentDate)) {
        // Use keys in special date as special week names
        return specialOpeningHours.keys.elementAt(i);
      }
    }
    return "";
  }  

  bool isSpecialDate(DateTime currentDate, List<List<DateTime>> specialDates) {
    for (int i = 0; i < specialDates.length - 1; i++) {
      DateTime startDate = specialDates[i][0];
      DateTime endDate = specialDates[i][specialDates[i].length-1];
      
      if (currentDate.isAfter(startDate) && currentDate.isBefore(endDate)) {
        return true;
      }
    }
  
  return false;
  }

  bool isSpecialDateOpen(DateTime currentDate, int currentDayOfWeek, String currentSpecialWeekName) {
    // Find corresponding opening hours for special date
    final currentTime = DateTime.now();

    if (specialOpeningHours != null && specialOpeningHours.containsKey(currentSpecialWeekName) && specialOpeningHours[currentSpecialWeekName] != null && specialOpeningHours[currentSpecialWeekName]!.containsKey(currentDayOfWeek) && specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek] != "CLOSED" && specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek] != "Open 24 Hours") {
      final openingHourRange = specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek]!.split(' - ');
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

    } else if (specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek] == "CLOSED") {
      // The gym is closed on current day
      return false;
    } else if (specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek] == "Open 24 Hours") {
      // The gym is open all the times
      return true;
    } else {

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

  String? returnSpecialTimeString(DateTime currentDate, int currentDayOfWeek, List<List<DateTime>> specialDates) {
    if (!isSpecialDate(currentDate, specialDates)) {
      return '';
    }

    final specialWeekName = getSpecialWeekName(currentDate, specialDates);
    return specialOpeningHours[specialWeekName]![currentDayOfWeek];

  }
}