import 'dart:convert';

import 'package:ca_todbadminton/screens/booking_completed_screen.dart';
import 'package:ca_todbadminton/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class ReservationController extends GetxController {
  var isLoading = true.obs;
  var reservationList = <Reservation>[].obs;
  final revNoteController = TextEditingController().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchReservations();
    super.onInit();
  }

  Future<void> fetchReservations() async {
    isLoading(true);
    try {
      var reservations = await RemoteService.fetchReservations();
      if (reservations != []) reservationList.value = reservations;
      print(reservations);
    } finally {
      isLoading(false);
    }
  }

  void addReservationAndDetails() async {
    isLoading(true);
    try {
      final revNo = RemoteService.revNoGenerator();
      var res = await RemoteService.addReservationAndDetails(revNo);
      if (res.statusCode == 201) {
        // isLoading(false);
        // Get.offAndToNamed(BookingCompleted.routeName);
        await RemoteService.addRfDetails(revNo, revNoteController.value.text);
        Get.offAndToNamed(BookingCompleted.routeName);
      } else {
        Get.snackbar('Create Reservation failed!', jsonDecode(res.body));
      }
    } catch (e) {
      isLoading(false);
      print(e);
      Get.snackbar('Create Reservation failed!', 'Unknown error occured');
    }
  }
}
