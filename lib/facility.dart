import 'package:flutter/material.dart';

class Facility {
  final String id;
  final String name;
  final Map<int, String> openingHours;
  final Map<String, Map<int, String>> specialOpeningHours;
  final List<List<DateTime>> specialDates;
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
    required this.specialOpeningHours,
    required this.specialDates,
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

    // Get current date
    final currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    // Check if current date is within any special period
    if (isSpecialDate(currentDate, specialDates)) {
      // Use special opening hours for current facility
      final currentSpecialWeekName = getSpecialWeekName(currentDate, specialDates);
      return isSpecialDateOpen(currentDate, currentDayOfWeek, currentSpecialWeekName);
    } else {
      // Use regular opening hours
      if (openingHours.containsKey(currentDayOfWeek) && openingHours[currentDayOfWeek] != "CLOSED" && openingHours[currentDayOfWeek] != "Open 24 Hours") {
        final List<DateTime> timeRanges = _parseTimeRanges(openingHours[currentDayOfWeek]!);

        // Get current time as DateTime
        final currentTime = DateTime.now();

        // Check if facility is open at any of specified time ranges
        for (int i = 0; i < timeRanges.length; i += 2) {
          final openingTime = timeRanges[i];
          final closingTime = (i + 1 < timeRanges.length) ? timeRanges[i + 1] : null;

          if (closingTime != null) {
            // Check if current time is within specified range
            if (currentTime.isAfter(openingTime) && currentTime.isBefore(closingTime)) {
              return true;
            }
          } else {
            // Check if current time is after specified opening time (no closing time)
            if (currentTime.isAfter(openingTime)) {
              return true;
            }
          }
        }
      } else if (openingHours[currentDayOfWeek] == "CLOSED") {
        return false;
      } else if (openingHours[currentDayOfWeek] == "Open 24 Hours") {
        return true;
      }
    }

    // The facility is closed on the current day or has no specified opening hours
    return false;
  }

  String getSpecialWeekName(DateTime currentDate, List<List<DateTime>> specialDates) {
    for (var i = 0; i < specialDates.length; i++) {
      if (specialDates[i].contains(currentDate)) {
        print("called");
        // Use keys in special date as special week names
        return specialOpeningHours.keys.elementAt(i);
      }
    }
    return "";
  }  

  bool isSpecialDate(DateTime currentDate, List<List<DateTime>> specialDates) {
    for (int i = 0; i < specialDates.length; i++) {
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
      final List<DateTime> timeRanges = _parseTimeRanges(specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek]!);

      // Check if facility is open at any of specified time ranges
      for (int i = 0; i < timeRanges.length; i += 2) {
        final openingTime = timeRanges[i];
        final closingTime = (i + 1 < timeRanges.length) ? timeRanges[i + 1] : null;

        if (closingTime != null) {
          // Check if current time is within specified range
          if (currentTime.isAfter(openingTime) && currentTime.isBefore(closingTime)) {
            return true;
          }
        } else {
          // Check if current time is after specified opening time (no closing time)
          if (currentTime.isAfter(openingTime)) {
            return true;
          }
        }
      }
    } else if (specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek] == "CLOSED") {
      // The facility is closed on current day
      return false;
    } else if (specialOpeningHours[currentSpecialWeekName]![currentDayOfWeek] == "Open 24 Hours") {
      // The facility is open all the time
      return true;
    }
     
    // The facility has no specified opening hours for special date
    return false;
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

  List<DateTime> _parseTimeRanges(String timeStr) {
    final timeRanges = timeStr.split(' | ');
    final List<DateTime> parsedTimes = [];

    for (var range in timeRanges) {
      final parts = range.split(' - ');
      final startTime = _parseTimeOfDay(parts[0]);
      final endTime = _parseTimeOfDay(parts[1]);
      parsedTimes.add(startTime);
      parsedTimes.add(endTime);
    }

    return parsedTimes;
  }

  String? returnSpecialTimeString(DateTime currentDate, int currentDayOfWeek, List<List<DateTime>> specialDates) {
    if (!isSpecialDate(currentDate, specialDates)) {
      return '';
    }

    final specialWeekName = getSpecialWeekName(currentDate, specialDates);
    return specialOpeningHours[specialWeekName]![currentDayOfWeek];

  }
}