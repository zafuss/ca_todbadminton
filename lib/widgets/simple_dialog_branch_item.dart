import 'package:ca_todbadminton/controllers/booking_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class SimpleDialogBranchItem extends StatelessWidget {
  const SimpleDialogBranchItem({
    Key? key,
    required this.branch,
  }) : super(key: key);

  final Branch branch;

  @override
  Widget build(BuildContext context) {
    final bookingInformationController = Get.put(BookingInformation());
    return SimpleDialogOption(
      onPressed: () {
        bookingInformationController.updateBranch(branch);
        Get.back();
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          branch.branchName,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        Text(branch.address, style: Theme.of(context).textTheme.headlineSmall!),
      ]),
    );
  }
}
