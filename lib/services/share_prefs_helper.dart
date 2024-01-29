import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class SharePrefs {
  static saveCustomerDataLocally(Customer customer) async {
    try {
      print(customer);
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('accessToken', customer.accessToken);
      await prefs.setString('refreshToken', customer.refreshToken);
      await prefs.setString('phoneNumber', customer.phoneNumber);

      print(await phoneNumber());
    } catch (e) {
      print(e.toString());
    }
  }

  static void deleteCustomerDataFromLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
    await prefs.remove('phoneNumber');
  }

  static Future<String?> accessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('accessToken');
  }

  static Future<String?> refreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('refreshToken');
  }

  static Future<String?> phoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('phoneNumber');
  }
}
