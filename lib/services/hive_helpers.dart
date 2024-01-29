import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/hive_customer.dart';
import '../models/models.dart';

class HiveHelper extends GetxController {
  var customer = getCustomerLocally(0);

  static Future<void> saveCustomerLocally(HiveCustomer hiveCustomer) async {
    // await Hive.box('customerBox').clear();
    var box = await Hive.openBox('customerBox');
    await box.add(hiveCustomer);
  }

  static HiveCustomer? getCustomerLocally(int index) {
    var box = Hive.box('customerBox');
    print(box);
    return box.getAt(index) as HiveCustomer;
  }

  static HiveCustomer convertToHiveCustomer(Customer customer) {
    return HiveCustomer(customer.username, customer.name, customer.email,
        customer.phoneNumber, customer.status);
  }

  // static void deleteSavedData() async {
  //   var box = await Hive.openBox('customerBox');
  //   // box.delete('customerBox');
  //   await Hive.deleteFromDisk();
  //   // await Hive.box('customerBox').clear();
  // }
}
