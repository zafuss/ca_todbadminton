import 'package:ca_todbadminton/models/hive_customer.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../services/hive_helpers.dart';

class LocalDataController extends GetxController {
  var customer = HiveHelper.getCustomerLocally(0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    // customer.value = HiveHelper.getCustomerLocally(0).obs;
    super.onInit();
  }
}
