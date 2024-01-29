import 'package:ca_todbadminton/controllers/customer_controller.dart';
import 'package:get/get.dart';
import '../models/models.dart';

class LocalDataController extends GetxController {
  var isLoading = false.obs;
  var customer = Customer(
          username: 'username',
          name: 'name',
          email: 'email',
          status: 'status',
          phoneNumber: 'phoneNumber',
          accessToken: 'accessToken',
          refreshToken: 'refreshToken')
      .obs;

  final customerController = Get.put(CustomerController());

  @override
  void onInit() async {
    // TODO: implement onInit
    // await getCustomer();
    super.onInit();
  }

  void updateCustomer(Customer newCustomer) {
    customer.value = newCustomer;
  }

//   Future<void> getCustomer() async {
//     try {
//       String? phoneNumber = await SharePrefs.phoneNumber();
//       if (phoneNumber == null || phoneNumber == '') {
//         isLoading(false);
//         Get.snackbar('Local Data Error', 'Cannot find current phone number');
//       } else {
//         isLoading(false);
//         customer =
//             await customerController.getCustomerByPhoneNumber(phoneNumber);
//         if (customer == null) {
//           Get.snackbar('Cannot find customer data', 'Some error occured');
//         }
//       }
//     } catch (e) {}
//   }
}
