import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ReservedCourt extends Equatable {
  final String branchID;
  final String courtID;
  final DateTime bookingDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final double price;

  ReservedCourt(
      {required this.bookingDate,
      required this.branchID,
      required this.courtID,
      required this.startTime,
      required this.endTime,
      this.price = 0.0});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [branchID, courtID, bookingDate, startTime, endTime, price];
}
