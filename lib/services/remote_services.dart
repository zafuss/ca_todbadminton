import 'package:ca_todbadminton/models/branch_model.dart';
import 'package:ca_todbadminton/models/models.dart';

class RemoteService {
  // static var

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
}
