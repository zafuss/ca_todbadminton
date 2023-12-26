import 'package:ca_todbadminton/compare_function.dart';
import 'package:ca_todbadminton/formatter.dart';
import 'package:flutter/material.dart';

class Validator {
  static String? searchingCourtValidator(
      String? branchID, TimeOfDay startTime, TimeOfDay endTime) {
    print(startTime);
    print(endTime);
    if (branchID == '') {
      return 'Please choose a branch.';
    }
    if (startTime.hour < 5 || endTime.hour > 22) {
      return 'The court can only be booked between 5am and 10pm.';
    }
    if (CompareFunction.timeOfDayCompare(startTime, endTime) == 1) {
      return 'End time must be after start time.';
    } else if (CompareFunction.timeOfDayCompare(startTime, endTime) == 0 ||
        Formatter.calculateTimeDifference(startTime, endTime) <= 0.5) {
      return 'The minimum time of the booking time must be higher than half an hour.';
    } else {
      return null;
    }
  }
}
