import 'package:ca_todbadminton/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class CourtController extends GetxController {
  var isLoading = true.obs;
  var courtList = <Court>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchCourts();
    super.onInit();
  }

  void fetchCourts() async {
    isLoading(true);
    try {
      var courts = await RemoteService.fetchCourts();
      if (courts != []) courtList.value = courts;
    } finally {
      isLoading(false);
    }
  }
}
