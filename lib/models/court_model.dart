import 'package:equatable/equatable.dart';

class Court extends Equatable {
  final String courtID;
  final String courtName;
  final String status;
  final DateTime startDate;
  final String branchID;

  Court(
      {required this.courtID,
      required this.courtName,
      required this.status,
      required this.startDate,
      required this.branchID});

  @override
  // TODO: implement props
  List<Object?> get props => [courtID, courtName, status, startDate, branchID];

  static List<Court> courts = [
    Court(
        courtID: 'SBT001',
        courtName: 'San 1',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT001'),
    Court(
        courtID: 'SBT002',
        courtName: 'San 2',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT001'),
    Court(
        courtID: 'STD001',
        courtName: 'San 1',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'TD001'),
  ];
}
