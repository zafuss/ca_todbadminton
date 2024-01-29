import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:ca_todbadminton/formatter.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final reservationController = Get.find<ReservationController>();
    final CustomDrawerController drawerController = CustomDrawerController();
    final noteController = TextEditingController();
    return Scaffold(
      endDrawer: CustomDrawer(),
      key: drawerController.scaffoldKey,
      bottomNavigationBar: Container(
          height: 75,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: largePadding),
            child: Obx(() {
              int count = bookingInformationController.courts.length;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                      )
                    ],
                  ),
                  reservationController.isLoading.isTrue
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // Nếu bạn muốn nút có màu khác khi disable, bạn có thể thay đổi màu sắc ở đây
                            backgroundColor: count > 0
                                ? primaryColor
                                : Colors.grey.withOpacity(0.5),
                          ),
                          onPressed: count > 0
                              ? () async {
                                  reservationController
                                      .addReservationAndDetails();
                                  // Get.toNamed(BookingCompleted.routeName);
                                }
                              : null,
                          child: Row(
                            children: [
                              Text(
                                'Checkout',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: count > 0
                                            ? Colors.white
                                            : Colors.grey),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 13,
                                color: count > 0 ? Colors.white : Colors.grey,
                              )
                            ],
                          ))
                ],
              );
            }),
          )),
      appBar: CustomHasTitleAppbar(
        backFunc: () => Get.back(),
        title: 'Confirm your reservation',
        controller: drawerController,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: minPadding / 2, horizontal: largePadding),
          child: Container(
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
              padding: EdgeInsets.all(minPadding),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: minPadding),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Branch',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Play Time',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Num of court',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                bookingInformationController.branchName.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Formatter.playTimeString(
                                    Formatter.convertStringToTimeOfDay(
                                        bookingInformationController
                                            .startTime.value),
                                    Formatter.convertStringToTimeOfDay(
                                        bookingInformationController
                                            .endTime.value)),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                bookingInformationController.courts.length
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    bookingInformationController.courts.length <= 0
                        ? Center(
                            child: TextButton(
                                onPressed: () => Get.back(),
                                child: Text('Choose your court again')),
                          )
                        : SizedBox(
                            height:
                                bookingInformationController.courts.length * 35,
                            child: ListView.builder(
                                itemCount:
                                    bookingInformationController.courts.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            bookingInformationController
                                                .courts[index].courtName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          GestureDetector(
                                            child: Text(
                                              'Remove',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(color: Colors.red),
                                            ),
                                            onTap: () {
                                              final searchController =
                                                  Get.find<ResultController>();
                                              double price = Formatter
                                                  .roundToNearestThousand(
                                                      searchController.result
                                                          .firstWhere((element) =>
                                                              element.courtID ==
                                                              bookingInformationController
                                                                  .courts[index]
                                                                  .courtID)
                                                          .price);
                                              bookingInformationController
                                                  .subPrice(price);
                                              bookingInformationController
                                                  .removeCourt(
                                                      bookingInformationController
                                                          .courts[index]);
                                            },
                                          ),
                                        ],
                                      ));
                                }),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(largePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking Information',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: primaryColor),
                        ),
                        const SizedBox(
                          width: 50,
                          child: Divider(
                            color: primaryColor,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: minPadding),
                    CustomTFF(
                        context: context,
                        title: 'Note',
                        multiline: true,
                        controller: noteController),
                    SizedBox(height: largePadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: primaryColor),
                        ),
                        const SizedBox(
                          width: 50,
                          child: Divider(
                            color: primaryColor,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    PaymentMethodSelection()
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
