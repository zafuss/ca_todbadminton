// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';

List<Reservation> reservationFromJson(String str) => List<Reservation>.from(
    json.decode(str).map((x) => Reservation.fromJson(x)));

String reservationToJson(List<Reservation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: must_be_immutable
class Reservation extends Equatable {
  String reservationNo;
  Username username;
  String phoneNumber;
  int deposite;
  DateTime createDate;
  DateTime bookingDate;
  DateTime startTime;
  DateTime endTime;
  PriceId priceId;
  int status;

  Reservation({
    required this.reservationNo,
    required this.username,
    required this.phoneNumber,
    required this.deposite,
    required this.createDate,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.priceId,
    required this.status,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        reservationNo: json["ReservationNo"],
        username: usernameValues.map[json["Username"]]!,
        phoneNumber: json["PhoneNumber"],
        deposite: json["Deposite"],
        createDate: DateTime.parse(json["CreateDate"]),
        bookingDate: DateTime.parse(json["BookingDate"]),
        startTime: DateTime.parse(json["StartTime"]),
        endTime: DateTime.parse(json["EndTime"]),
        priceId: priceIdValues.map[json["PriceID"]]!,
        status: json["_Status"],
      );

  Map<String, dynamic> toJson() => {
        "ReservationNo": reservationNo,
        "Username": usernameValues.reverse[username],
        "PhoneNumber": phoneNumber,
        "Deposite": deposite,
        "CreateDate": createDate.toIso8601String(),
        "BookingDate": bookingDate.toIso8601String(),
        "StartTime": startTime.toIso8601String(),
        "EndTime": endTime.toIso8601String(),
        "PriceID": priceIdValues.reverse[priceId],
        "_Status": status,
      };

  static List<Reservation> reservations = [
    Reservation(
        reservationNo: 'Rev0710230000',
        username: Username.ADMIN,
        phoneNumber: '0823216213',
        deposite: 300000,
        createDate: DateTime.parse('2023-01-16T10:34:09.000Z'),
        bookingDate: DateTime.parse('2023-12-15T10:34:09.000Z'),
        startTime: DateTime.parse('2023-12-15T00:00:00.000Z'),
        endTime: DateTime.parse('2023-12-15T23:00:00.000Z'),
        priceId: PriceId.P001,
        status: 4),
    Reservation(
        reservationNo: 'Rev0710230001',
        username: Username.ADMIN,
        phoneNumber: '0823216213',
        deposite: 300000,
        createDate: DateTime.parse('2023-12-08T17:34:09.000Z'),
        bookingDate: DateTime.parse('2023-12-16T19:34:09.000Z'),
        startTime: DateTime.parse('2023-12-16T12:34:09.000Z'),
        endTime: DateTime.parse('2023-12-16T13:34:09.000Z'),
        priceId: PriceId.P001,
        status: 4),
    Reservation(
        reservationNo: 'Rev0710230002',
        username: Username.ADMIN,
        phoneNumber: '0823216213',
        deposite: 300000,
        createDate: DateTime.parse('2023-12-08T17:34:09.000Z'),
        bookingDate: DateTime.parse('2023-12-17T19:34:09.000Z'),
        startTime: DateTime.parse('2023-12-17T12:34:09.000Z'),
        endTime: DateTime.parse('2023-12-17T13:34:09.000Z'),
        priceId: PriceId.P001,
        status: 4),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [
        reservationNo,
        username,
        deposite,
        createDate,
        bookingDate,
        startTime,
        endTime,
        priceId,
        status
      ];
}

enum PriceId { P001, P002 }

final priceIdValues = EnumValues({"P001": PriceId.P001, "P002": PriceId.P002});

enum Username { ADMIN, CUSTOMERAPP }

final usernameValues =
    EnumValues({"admin": Username.ADMIN, "customerapp": Username.CUSTOMERAPP});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
