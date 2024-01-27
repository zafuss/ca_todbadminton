import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Customer> customerFromJson(String str) =>
    List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));

class Customer extends Equatable {
  final String username;
  // final String password;
  final String name;

  final String email;
  final String phoneNumber;
  final String status;
  final String accessToken;
  final String refreshToken;

  Customer({
    required this.username,
    // required this.password,
    required this.name,
    required this.email,
    required this.status,
    required this.phoneNumber,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      username: json['Username'],
      // password: json['_Password'],
      name: json['FullName'],
      email: json['Email'],
      phoneNumber: json['PhoneNumber'],
      status: json['_Status'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken']);

  static List<Customer> customers = [
    Customer(
        username: 'zafus',
        // password: 'Phu12382',
        name: 'Đặng Hoàng Gia Phú',
        email: 'zafus2103@gmail.com',
        status: 'active',
        phoneNumber: '0823216213',
        accessToken:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjA4MjMxMjMxMjciLCJpYXQiOjE3MDYyNDMwNzV9.tGZ7Gzf5qW-NiXHfJXu18ogSMl50-Cbp-ncD6QJf89U",
        refreshToken:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjA4MjMxMjMxMjciLCJpYXQiOjE3MDYyNDMwNzUsImV4cCI6MTczNzc3OTA3NX0.KDtYbifjzS-xlSBQPEnotJcp7I4Tc3mI3UaiRdMfwtU"),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [
        username,
        // password,
        name,
        email,
        status,
        phoneNumber,
        accessToken,
        refreshToken
      ];
}
