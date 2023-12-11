import 'package:ca_todbadminton/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class ReservationController extends GetxController {
  var isLoading = true.obs;
  var reservationList = <Reservation>[].obs;
  @override
  void onInit() {
    print('reservations is being init');
    // TODO: implement onInit
    fetchReservations();
    super.onInit();
  }

  void fetchReservations() async {
    isLoading(true);
    try {
      var reservations = await RemoteService.fetchReservations();
      if (reservations != null) reservationList.value = reservations;
      print(reservationList.value);
    } finally {
      isLoading(false);
    }
  }
}
