import 'package:ca_todbadminton/controllers/branch_controller.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:ca_todbadminton/controllers/rf_detail_controller.dart';
import 'package:ca_todbadminton/formatter.dart';
import 'package:ca_todbadminton/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  var resultList = [].obs;
  var branches = [].obs;
  var courts = [].obs;
  var prices = [].obs;
  var reservations = [].obs;
  var rfdetails = [].obs;
  var newRfdetails = [].obs;
  var isLoading = true.obs;

  final BookingInformation bookingInformationController = Get.find();
  final BranchController branchController = Get.find();
  final courtController = Get.put(CourtController());
  final priceController = Get.put(PriceController());
  final reservationController = Get.put(ReservationController());
  final rfdetailController = Get.put(RfDetailController());

  @override
  void onInit() {
    branches.value = branchController.branchList;
    courts.value = courtController.courtList;
    prices.value = priceController.priceList;
    reservations.value = reservationController.reservationList;
    // TODO: implement onInit
    print('is being init');
    try {
      fetchResult(
          branchID: bookingInformationController.branchID,
          bookingDate: Formatter.convertStringToDateTime(
              bookingInformationController.bookingDate.value),
          startTime: Formatter.convertStringToTimeOfDay(
              bookingInformationController.startTime.value),
          endTime: Formatter.convertStringToTimeOfDay(
              bookingInformationController.endTime.value));
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  void fetchResult(
      {required branchID,
      required DateTime bookingDate,
      required TimeOfDay startTime,
      required TimeOfDay endTime}) {
    try {
      isLoading(true);
      print(reservations.value);
      for (Reservation reservation in reservations.value) {
        newRfdetails.value += fetchReservationResult(
                branchID: branchID,
                bookingDate: bookingDate,
                startTime: startTime,
                endTime: endTime,
                reservation: reservation)
            .obs;
        print('newRfdetails.value');
      }
    } finally {
      isLoading(false);
    }
  }

  List<RfDetail> fetchReservationResult(
      {required branchID,
      required DateTime bookingDate,
      required TimeOfDay startTime,
      required TimeOfDay endTime,
      required Reservation reservation}) {
    return rfdetailController.rfDetailList.value
      ..where((element) => element.reservationNo == reservation.reservationNo)
          .toList();
  }

  int timeOfDayCompare(TimeOfDay t1, TimeOfDay t2) {
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
}
