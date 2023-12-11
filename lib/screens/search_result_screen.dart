import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/booking_information_controller.dart';
import 'package:ca_todbadminton/controllers/court_controller.dart';
import 'package:ca_todbadminton/controllers/search_result_controller.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String routeName = '/searchResult';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const SearchScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    // final courtController = Get.put(CourtController());
    // final bookingInformationController = Get.put(BookingInformation());
    final searchResultController = Get.put(ResultController());
    return Scaffold(
      appBar: CustomHasTitleAppbar(
        title: 'Search Result',
      ),
      body: searchResultController.isLoading.value
          ? CircularProgressIndicator()
          : Padding(
              padding: EdgeInsets.all(largePadding),
              child: Obx(
                () => ListView.builder(
                  itemBuilder: ((context, index) => Text(
                        searchResultController
                            .newRfdetails[index].value.reservationNo,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      )),
                  itemCount: searchResultController.newRfdetails.value.length,
                ),
              )),
    );
  }
}

class CourtInformation extends StatelessWidget {
  const CourtInformation({
    super.key,
    required this.court,
  });
  final Court court;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // color: Color(0x0C591B1B),
              color: primaryColor.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
              spreadRadius: 0,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadius * 2)),
      child: Padding(
          padding: const EdgeInsets.only(
              left: minPadding,
              right: minPadding,
              bottom: minPadding,
              top: minPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  court.branchID,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  court.courtName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: minPadding,
                ),
                CustomElevatedButton(title: 'Select', onPressed: () {})
              ])),
    );
  }
}
