import 'package:flutter/material.dart';

class CompareFunction {
  static int timeOfDayCompare(TimeOfDay t1, TimeOfDay t2) {
    if (t1.hour > t2.hour) {
      return 1;
    }
    if (t1.hour < t2.hour) {
      return -1;
    }
    if (t1.minute > t2.minute) {
      return 1;
    }
    if (t1.minute < t2.minute) {
      return -1;
    } else {
      return 0;
    }
  }

  static bool areDatesEqual(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
