import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:ca_todbadminton/formatter.dart';
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
            padding: EdgeInsets.all(minPadding),
            child: Obx(
              () => Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Branch: ${bookingInformationController.branchName.value}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          'Court: ${bookingInformationController.court.value}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Text(
                      Formatter.playTimeString(
                          Formatter.convertStringToTimeOfDay(
                              bookingInformationController.startTime.value),
                          Formatter.convertStringToTimeOfDay(
                              bookingInformationController.endTime.value)),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bookingInformationController.startTime.value,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                      ),
                      Text('-',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                      Text(
                        bookingInformationController.endTime.value,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Price: ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      bookingInformationController.prices.toInt().toString() +
                          'đ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: Colors.black),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(largePadding),
          child: Column(
            children: [
              CustomTFF(context: context, title: 'Name'),
              SizedBox(height: minPadding),
              CustomTFF(context: context, title: 'Phone Number')
            ],
          ),
        )
      ]),
    );
  }
}
