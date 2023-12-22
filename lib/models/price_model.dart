// To parse this JSON data, do
//
//     final price = priceFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Price> priceFromJson(String str) =>
    List<Price>.from(json.decode(str).map((x) => Price.fromJson(x)));

String priceToJson(List<Price> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: must_be_immutable
class Price extends Equatable {
  String priceId;
  int priceTag;
  double timeFactor;
  double dateFactor;
  int status;

  Price({
    required this.priceId,
    required this.priceTag,
    required this.timeFactor,
    required this.dateFactor,
    required this.status,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        priceId: json["PriceID"],
        priceTag: json["PriceTag"],
        timeFactor: json["TimeFactor"]?.toDouble(),
        dateFactor: json["DateFactor"]?.toDouble(),
        status: json["_Status"],
      );

  Map<String, dynamic> toJson() => {
        "PriceID": priceId,
        "PriceTag": priceTag,
        "TimeFactor": timeFactor,
        "DateFactor": dateFactor,
        "_Status": status,
      };

  static List<Price> prices = [
    Price(
        priceId: 'P001',
        priceTag: 50000,
        timeFactor: 1.25,
        dateFactor: 1.5,
        status: 1),
    Price(
        priceId: 'P002',
        priceTag: 50000,
        timeFactor: 1.25,
        dateFactor: 1.5,
        status: 0),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
