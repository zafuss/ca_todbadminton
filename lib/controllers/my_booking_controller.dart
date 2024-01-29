import 'package:ca_todbadminton/formatter.dart';
import 'package:ca_todbadminton/models/reservation_model.dart';
import 'package:ca_todbadminton/models/rf_detail_model.dart';
import 'package:ca_todbadminton/services/share_prefs_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import 'controllers.dart';

class MyBookingController extends GetxController {
  var isLoading = false.obs;
  var myBookingData = <MyBookingData>[].obs;
  var revListByCustomer = <Reservation>[].obs;
  var revDetailList = <RfDetail>[].obs;
  final branchController = Get.find<BranchController>();
  final courtController = Get.put(CourtController());
  final priceController = Get.put(PriceController());
  final reservationController = Get.put(ReservationController());
  final rfdetailController = Get.put(RfDetailController());
  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
  @override
  void onInit() async {
    // TODO: implement onInit
    isLoading(true);
    super.onInit();
    await branchController.fetchBranches();
    await courtController.fetchCourts();
    await priceController.fetchPrices();
    await reservationController.fetchReservations();
    await rfdetailController.fetchReservations();
    // print(reservationController.reservationList.length);
    await fetchResult();
    print(myBookingData);
  }

  Future<void> fetchRev() async {
    // isLoading(true);
    var phoneNumber = await SharePrefs.phoneNumber();
    for (int i = 0; i < reservationController.reservationList.length; i++) {
      if (reservationController.reservationList[i].phoneNumber == phoneNumber) {
        revListByCustomer.add(reservationController.reservationList[i]);
      }
    }
    // isLoading(false);
  }

  Future<void> fetchResult() async {
    try {
      await fetchRev();
      for (int i = 0; i < revListByCustomer.length; i++) {
        var rev = revListByCustomer[i];
        for (int j = 0; j < rfdetailController.rfDetailList.length; j++) {
          if (rfdetailController.rfDetailList[j].reservationNo ==
              rev.reservationNo) {
            revDetailList.add(rfdetailController.rfDetailList[j]);
          }
        }
        print(revDetailList);
        List<Court> courtListByCustomer = [];
        for (int i = 0; i < revDetailList.length; i++) {
          var revDetail = revDetailList[i];
          for (int j = 0; j < courtController.courtList.length; j++) {
            if (revDetail.courtId == courtController.courtList[j].courtID &&
                !courtListByCustomer.contains(courtController.courtList[j])) {
              courtListByCustomer.add(courtController.courtList[j]);
            }
          }
        }

        MyBookingData bookingData = MyBookingData(
            revNo: rev.reservationNo,
            bookingDate: Formatter.formatDateTime(rev.bookingDate),
            startTime: Formatter.formatTimeOfDay(
                TimeOfDay.fromDateTime(rev.startTime)),
            endTime:
                Formatter.formatTimeOfDay(TimeOfDay.fromDateTime(rev.endTime)),
            courtList: courtListByCustomer,
            branch: branchController.branchList
                .firstWhere((element) =>
                    element.branchID == courtListByCustomer[0].branchID)
                .branchName,
            prices: rev.deposite,
            status: rev.status,
            note: revDetailList[0].note ?? '');
        myBookingData.add(bookingData);
        isLoading(false);
        revDetailList.clear();
      }
    } catch (e) {
      isLoading(false);
      print(e);
      Get.snackbar('Get your booking failed', e.toString());
    }
  }

  void resetData() {
    myBookingData.value = [];
    revDetailList.value = [];
    revListByCustomer.value = [];
  }
}
