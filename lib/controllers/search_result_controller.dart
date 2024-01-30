import 'package:ca_todbadminton/compare_function.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:ca_todbadminton/formatter.dart';
import 'package:ca_todbadminton/models/models.dart';
import 'package:ca_todbadminton/services/remote_services.dart';
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
  var result = [].obs;
  var reservedCourts = [].obs;
  var status = 0.obs;

  late final BookingInformation bookingInformationController;
  late final branchController;
  final courtController = Get.put(CourtController());
  final priceController = Get.put(PriceController());
  final reservationController = Get.put(ReservationController());
  final rfdetailController = Get.put(RfDetailController());

  Future<void> fetchData() async {
    reservations.value = await RemoteService.fetchReservations();
    branches.value = await RemoteService.fetchBranches();
    prices.value = await RemoteService.fetchPrices();
    courts.value = await RemoteService.fetchCourts();
    courts.value = courts
        .where((element) =>
            element.branchID == bookingInformationController.branchID.value)
        .toList();
    print(courts);
    rfdetails.value = await RemoteService.fetchRfDetails();
  }

  @override
  void onInit() async {
    bookingInformationController = Get.put(BookingInformation());
    Get.delete<BranchController>();
    branchController = Get.put(BranchController());
    await fetchData();
    print(reservations);
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

  Future<void> fetchResult(
      {required branchID,
      required DateTime bookingDate,
      required TimeOfDay startTime,
      required TimeOfDay endTime}) async {
    try {
      isLoading(true);

      for (Reservation reservation in reservations) {
        newRfdetails += fetchReservationResult(
                branchID: branchID,
                bookingDate: bookingDate,
                startTime: startTime,
                endTime: endTime,
                reservation: reservation)
            .obs;
      }
    } finally {
      if (newRfdetails != [].obs) {
        for (RfDetail newRfdetail in newRfdetails) {
          print(newRfdetail);
          Reservation reservationByDetail = reservations.firstWhere(
              (element) => element.reservationNo == newRfdetail.reservationNo);
          reservedCourts.add(ReservedCourt(
            bookingDate: reservationByDetail.bookingDate,
            branchID: branchID.value,
            startTime: TimeOfDay.fromDateTime(reservationByDetail.startTime),
            courtID: newRfdetail.courtId,
            endTime: TimeOfDay.fromDateTime(reservationByDetail.endTime),
          ));
        }
      }
      int i = 0;
      print(reservedCourts);
      for (Court court in courts) {
        Price price = prices.firstWhere((element) => element.status == 1);
        bookingInformationController.updatePriceID(price.priceId);
        i++;
        print(
            'check result: ${checkAvailability(startTime, endTime, bookingDate, reservedCourts, court)}, court: ${court.courtID}');
        if (checkAvailability(
            startTime, endTime, bookingDate, reservedCourts, court)) {
          print(i);
          print(prices.firstWhere((element) => element.status == 1).priceTag *
              Formatter.calculateTimeDifference(startTime, endTime));
          result.add(AvailableCourt(
              bookingDate: bookingDate,
              branchID: court.branchID,
              courtID: court.courtID,
              startTime: startTime,
              endTime: endTime,
              price: price.priceTag *
                  Formatter.calculateTimeDifference(startTime, endTime)));
        }
      }
      print(result.length);
      print(result.isEmpty);
      if (await result.isEmpty) {
        status.value = -1;
        print('changed');
      } else {
        status.value = 1;
      }
    }
  }

  List<RfDetail> fetchReservationResult(
      {required branchID,
      required DateTime bookingDate,
      required TimeOfDay startTime,
      required TimeOfDay endTime,
      required Reservation reservation}) {
    List<RfDetail> result = [];
    for (RfDetail rfDetail in rfdetails) {
      List courtList = courts
          .where((element) =>
              element.branchID ==
              branches
                  .firstWhere((element) => element.branchID == branchID.value)
                  .branchID)
          .toList();
      for (var court in courtList) {
        if (rfDetail.reservationNo == reservation.reservationNo &&
            CompareFunction.areDatesEqual(
                bookingDate, reservation.bookingDate) &&
            rfDetail.courtId == court.courtID) {
          result.add(rfDetail);
        }
      }
    }
    return result;
  }

  bool checkAvailability(TimeOfDay desiredStartTime, TimeOfDay desiredEndTime,
      DateTime bookingDate, RxList<dynamic> reservedCourts, Court court) {
    // Kiểm tra từng đặt sân trong danh sách
    for (var reservedCourt in reservedCourts) {
      // Kiểm tra xem thời gian mong muốn có trùng với bất kỳ đặt sân nào không
      // print(court.courtID == reservedCourt.courtID);
      if (court.courtID == reservedCourt.courtID) {
        if (CompareFunction.areDatesEqual(
                    bookingDate, reservedCourt.bookingDate) &&
                //startTime ko hop le. endTime ko hop le
                (CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) == 1 ||
                    CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) ==
                        0) &&
                (CompareFunction.timeOfDayCompare(desiredEndTime, reservedCourt.endTime) == -1 ||
                    CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) ==
                        0) ||
            // startTime hop le. endTime ko hop le
            (CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) == -1 || CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) == 0) &&
                (CompareFunction.timeOfDayCompare(desiredEndTime, reservedCourt.endTime) == -1 ||
                    CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) ==
                        0) &&
                (CompareFunction.timeOfDayCompare(desiredEndTime, reservedCourt.startTime)) ==
                    1 ||
            // startTime ko hop le
            (CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) == 1 || CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) == 0) &&
                (CompareFunction.timeOfDayCompare(desiredEndTime, reservedCourt.endTime) == 1 ||
                    CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) ==
                        0) &&
                (CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.endTime)) ==
                    -1 ||
            //
            (CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) == -1 || CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) == 0) &&
                (CompareFunction.timeOfDayCompare(desiredEndTime, reservedCourt.endTime) == 1 ||
                    CompareFunction.timeOfDayCompare(desiredStartTime, reservedCourt.startTime) ==
                        0)) {
          return false; // Thời gian đã được đặt trước
        } else {
          return true; // Thời gian khả dụng
        }
      }
    }
    return true;
  }
}
