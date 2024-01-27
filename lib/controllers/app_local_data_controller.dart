import 'package:ca_todbadminton/controllers/customer_controller.dart';
import 'package:ca_todbadminton/services/share_prefs_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../models/models.dart';
import '../services/hive_helpers.dart';

class LocalDataController extends GetxController {
  var isLoading = false.obs;
  Customer? customer;

  final customerController = Get.put(CustomerController());

  @override
  void onInit() async {
    // TODO: implement onInit
    await getCustomer();
    super.onInit();
  }

  Future<void> getCustomer() async {
    try {
      String? phoneNumber = await SharePrefs.phoneNumber();
      if (phoneNumber == null || phoneNumber == '') {
        isLoading(false);
        Get.snackbar('Local Data Error', 'Cannot find current phone number');
      } else {
        isLoading(false);
        customer =
            await customerController.getCustomerByPhoneNumber(phoneNumber);
        if (customer == null) {
          Get.snackbar('Cannot find customer data', 'Some error occured');
        }
      }
    } catch (e) {}
  }
}
