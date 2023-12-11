import 'package:ca_todbadminton/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class RfDetailController extends GetxController {
  var isLoading = true.obs;
  var rfDetailList = <RfDetail>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchReservations();
    super.onInit();
  }

  void fetchReservations() async {
    isLoading(true);
    try {
      var rfDetails = await RemoteService.fetchRfDetails();
      if (rfDetails != null) rfDetailList.value = rfDetails;
    } finally {
      isLoading(false);
    }
  }
}
