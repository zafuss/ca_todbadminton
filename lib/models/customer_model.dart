import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String username;
  final String password;
  final String name;

  final String email;
  final String phoneNumber;
  final String status;

  Customer(
      {required this.username,
      required this.password,
      required this.name,
      required this.email,
      required this.status,
      required this.phoneNumber});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      username: json['Username'],
      password: json['_Password'],
      name: json['FullName'],
      email: json['Email'],
      phoneNumber: json['PhoneNumber'],
      status: json['_Status']);

  static List<Customer> customers = [
    Customer(
        username: 'zafus',
        password: 'Phu12382',
        name: 'Đặng Hoàng Gia Phú',
        email: 'zafus2103@gmail.com',
        status: 'active',
        phoneNumber: '0823216213')
  ];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
