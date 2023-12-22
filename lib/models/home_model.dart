import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends Equatable {
  String branch;
  DateTime bookingDate;
  TimeOfDay startTime;
  TimeOfDay endTime;

  Home({
    required this.branch,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [branch, bookingDate, startTime, endTime];
}
