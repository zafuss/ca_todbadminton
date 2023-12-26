import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/booking_information_controller.dart';
import 'package:ca_todbadminton/controllers/search_result_controller.dart';
import 'package:ca_todbadminton/formatter.dart';
import 'package:ca_todbadminton/screens/screens.dart';
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
    final bookingInformationController = Get.put(BookingInformation());
    Get.delete<ResultController>();
    final searchResultController = Get.put(ResultController());
    return Scaffold(
        appBar: CustomHasTitleAppbar(
          title: 'Search Result',
          backFunc: () {
            Get.back();
          },
        ),
        body: Obx(() => Center(
            child: searchResultController.status.value == 0
                ? const CircularProgressIndicator()
                : searchResultController.status.value == 1
                    ? ListView.builder(
                        itemCount: searchResultController.result.length,
                        itemBuilder: (context, index) {
                          Branch branch = searchResultController.branches
                              .firstWhere((element) =>
                                  element.branchID ==
                                  searchResultController
                                      .result[index].branchID);
                          Court court = searchResultController.courts
                              .firstWhere((element) =>
                                  element.courtID ==
                                  searchResultController.result[index].courtID);
                          double prices = Formatter.roundToNearestThousand(
                              searchResultController.result[index].price);
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: minPadding / 2,
                                horizontal: largePadding),
                            child: Container(
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
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius * 2)),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: minPadding,
                                          right: minPadding,
                                          bottom: minPadding,
                                          top: minPadding),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Branch: ${branch.branchName}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                  Text(
                                                    'Court: ${court.courtName}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height: 100,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      Formatter.formatTimeOfDay(
                                                          searchResultController
                                                              .result[index]
                                                              .startTime),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    Text('-',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                    Text(
                                                      Formatter.formatTimeOfDay(
                                                          searchResultController
                                                              .result[index]
                                                              .endTime),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  Container(
                                    height: 1,
                                    color: primaryColor.withOpacity(0.5),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: minPadding),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: minPadding,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Price',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              '${prices.toInt().toString()}đ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                      color: Colors.black),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: minPadding),
                                          child: CustomElevatedButton(
                                              title: 'Select',
                                              onPressed: () {
                                                bookingInformationController
                                                    .updateCourt(court);
                                                bookingInformationController
                                                    .updateBranch(branch);
                                                bookingInformationController
                                                    .updatePrices(prices);
                                                Get.toNamed(
                                                    ConfirmBooking.routeName);
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Text(
                        'There are no courts available at this time.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ))));
  }
}
