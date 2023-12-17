import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatter {
  static String formatTimeOfDay(TimeOfDay time) {
    // Convert TimeOfDay to DateTime to format the time
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);

    // Format the time as hh:mm AM/PM
    final formattedTime = DateFormat('hh:mm a').format(dateTime);

    return formattedTime;
  }

  static String formatDateTime(date) {
    // Format the DateTime to the desired format
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static TimeOfDay convertStringToTimeOfDay(String timeString) {
    DateFormat format = DateFormat('hh:mm a');
    DateTime dateTime = format.parse(timeString);

    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  static DateTime convertStringToDateTime(String dateString) {
    DateFormat format = DateFormat('dd-MM-yyyy');

    return format.parse(dateString);
  }

  static double calculateTimeDifference(
      TimeOfDay startTime, TimeOfDay endTime) {
    DateTime startDate = DateTime(2023, 1, 1, startTime.hour, startTime.minute);
    DateTime endDate = DateTime(2023, 1, 1, endTime.hour, endTime.minute);

    Duration timeDifference = endDate.difference(startDate);

    // Convert the time difference to hours as a float
    double resultFloat = timeDifference.inMinutes / 60.0;

    return resultFloat;
  }

  static double roundToNearestThousand(double number) {
    return (number / 1000).roundToDouble() * 1000;
  }
}
