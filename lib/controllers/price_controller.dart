import 'package:ca_todbadminton/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class PriceController extends GetxController {
  var isLoading = true.obs;
  var priceList = <Price>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchPrices();
    super.onInit();
  }

  void fetchPrices() async {
    isLoading(true);
    try {
      var prices = await RemoteService.fetchPrices();
      if (prices != []) priceList.value = prices;
    } finally {
      isLoading(false);
    }
  }
}
