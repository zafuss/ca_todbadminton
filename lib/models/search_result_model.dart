import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  final String branchName;
  final String courtName;
  final String startTime;
  final DateTime endTime;
  final double price;

  SearchResult(
      {required this.branchName,
      required this.courtName,
      required this.startTime,
      required this.endTime,
      this.price = 0.0});

  @override
  // TODO: implement props
  List<Object?> get props => [branchName, courtName, startTime, endTime];
}
