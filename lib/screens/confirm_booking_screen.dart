import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({Key? key}) : super(key: key);

  static const String routeName = '/confirmbooking';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const ConfirmBooking(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final bookingInformationController = Get.find<BookingInformation>();
    print(bookingInformationController.branchName.value);
    return Scaffold(
      appBar: CustomHasTitleAppbar(
        backFunc: () => Get.back(),
        title: 'Confirm your reservation',
      ),
      body: Column(children: [
        Container(
          color: Color.fromRGBO(238, 239, 239, 1),
          child: Padding(
            child: Obx(
              () => Column(children: [
                Row(
                  children: [
                    Text(
                      bookingInformationController.branchName.value,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
              ]),
            ),
            padding: EdgeInsets.all(minPadding),
          ),
        )
      ]),
    );
  }
}
