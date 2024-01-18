import 'package:hive/hive.dart';

import 'models.dart';
part 'hive_customer.g.dart';

@HiveType(typeId: 0)
class HiveCustomer {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String phoneNumber;
  @HiveField(5)
  final String status;

  HiveCustomer(this.username, this.password, this.name, this.email,
      this.phoneNumber, this.status);
}
