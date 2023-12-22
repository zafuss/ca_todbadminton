import 'package:ca_todbadminton/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ca_todbadminton/models/models.dart';

class BookingInformation extends GetxController {
  var branchName = ''.obs;
  var branchID = ''.obs;
  var court = ''.obs;
  var bookingDate = ''.obs;
  var startTime = ''.obs;
  var endTime = TimeOfDay.now().toString().obs;
  var address = ''.obs;

  BookingInformation() {
    TimeOfDay nextQuarterHour = Formatter.getNextQuarterHour(TimeOfDay.now());
    startTime = Formatter.formatTimeOfDay(nextQuarterHour).obs;

    endTime = Formatter.formatTimeOfDay(TimeOfDay(
            hour: (nextQuarterHour.hour + 1) % 24,
            minute: nextQuarterHour.minute))
        .obs;
    bookingDate = Formatter.formatDateTime(DateTime.now()).obs;
  }

  UpdateBookingInformation(
      {required branchID,
      required branchName,
      required court,
      required bookingDate,
      required startTime,
      required address,
      required endTime}) {
    this.branchID = branchID as RxString;
    this.branchName = branchName as RxString;
    this.court = court as RxString;
    this.bookingDate = bookingDate as RxString;
    this.startTime = startTime as RxString; // Corrected variable name
    this.endTime = endTime as RxString; // Corrected variable name
  }

  void updateBranch(Branch branch) {
    var rxBranchName = branch.branchName.obs;
    var rxBranchID = branch.branchID.obs;
    this.branchName.value = rxBranchName.value;
    this.branchID.value = rxBranchID.value;
    this.address.value = branch.address.obs.value;
    print(this.branchID);
  }

  void updateCourt(Court court) {
    this.court = court.courtName as RxString;
  }

  void updateBookingDate(bookingDate) {
    this.bookingDate.value = Formatter.formatDateTime(bookingDate);
  }

  void updateStartTime(startTime) {
    this.startTime.value = Formatter.formatTimeOfDay(startTime).obs.value;
    print(startTime);
  }

  void updateEndTime(endTime) {
    this.endTime.value = Formatter.formatTimeOfDay(endTime).obs.value;
    print(endTime);
  }
}
