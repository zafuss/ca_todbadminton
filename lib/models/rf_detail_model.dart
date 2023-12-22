import 'dart:convert';

import 'package:equatable/equatable.dart';

List<RfDetail> rfDetailFromJson(String str) =>
    List<RfDetail>.from(json.decode(str).map((x) => RfDetail.fromJson(x)));

String rfDetailToJson(List<RfDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: must_be_immutable
class RfDetail extends Equatable {
  String reservationNo;
  String courtId;
  String? note;

  RfDetail({
    required this.reservationNo,
    required this.courtId,
    this.note,
  });

  factory RfDetail.fromJson(Map<String, dynamic> json) => RfDetail(
        reservationNo: json["ReservationNo"],
        courtId: json["CourtID"],
        note: json["Note"],
      );

  Map<String, dynamic> toJson() => {
        "ReservationNo": reservationNo,
        "CourtID": courtId,
        "Note": note,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [reservationNo, courtId, note];

  static List<RfDetail> rfDetails = [
    RfDetail(reservationNo: 'Rev0710230000', courtId: 'SBT001', note: null),
    RfDetail(reservationNo: 'Rev0710230000', courtId: 'SBT002', note: null),
    RfDetail(reservationNo: 'Rev0710230001', courtId: 'SBT002', note: null),
    RfDetail(reservationNo: 'Rev0710230002', courtId: 'STD001', note: null),
  ];
}
