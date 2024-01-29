import 'package:equatable/equatable.dart';

import 'models.dart';

class MyBookingData extends Equatable {
  final String revNo;
  final String bookingDate;
  final String startTime;
  final String endTime;
  final List<Court> courtList;
  final String branch;
  final int prices;
  final int status;
  final String note;

  MyBookingData({
    required this.revNo,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.courtList,
    required this.branch,
    required this.prices,
    required this.status,
    required this.note,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        revNo,
        bookingDate,
        startTime,
        endTime,
        courtList,
        branch,
        prices,
        status,
        note
      ];
}
