import 'dart:convert';

import 'package:ca_todbadminton/models/branch_model.dart';
import 'package:ca_todbadminton/models/models.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<List<Branch>> fetchBranches() async {
    var branches = await Branch.branches;
    return branches;
  }

  static Future<List<Court>> fetchCourts() async {
    var courts = await Court.courts;
    return courts;
  }

  static Future<List<Price>> fetchPrices() async {
    var prices = await Price.prices;
    return prices;
  }

  static Future<List<Reservation>> fetchReservations() async {
    var reservations = await Reservation.reservations;
    return reservations;
  }

  static Future<List<RfDetail>> fetchRfDetails() async {
    var rfDetails = await RfDetail.rfDetails;
    return rfDetails;
  }

  static Future<List<Customer>> fetchCustomers() async {
    http.Response response = await http
        .get(Uri.parse("https://badminton-backend.onrender.com/customers"));
    if (response.statusCode == 200) {
      return customerFromJson(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<Customer> loginCustomer(
      String phoneNumber, String password) async {
    final body = jsonEncode({
      'PhoneNumber': phoneNumber.toString(),
      '_Password': password.toString()
    });
    print(body);
    final http.Response res = await http.post(
        Uri.parse('https://badminton-backend.onrender.com/v1/auth/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      return Customer.fromJson(json.decode(utf8.decode(res.bodyBytes)));
    } else {
      print(json.decode(res.body));
      throw Exception(json.decode(res.body)['message']);
    }
  }
}
