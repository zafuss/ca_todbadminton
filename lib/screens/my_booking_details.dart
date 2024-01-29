import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:ca_todbadminton/formatter.dart';
import 'package:ca_todbadminton/models/models.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyBookingDetails extends StatelessWidget {
  const MyBookingDetails({Key? key, required this.myBookingData})
      : super(key: key);
  final MyBookingData myBookingData;
  static const String routeName = '/mybookingdetails';

  // static Route route() {
  //   return MaterialPageRoute(
  //       builder: (context) => const MyBookingDetails(myBookingData: myBookingData,),
  //       settings: const RouteSettings(name: routeName));
  // }

  @override
  Widget build(BuildContext context) {
    final CustomDrawerController drawerController = CustomDrawerController();

    return Scaffold(
      endDrawer: CustomDrawer(),
      key: drawerController.scaffoldKey,
      appBar: CustomHasTitleAppbar(
        backFunc: () => Get.back(),
        title: 'Booking ${myBookingData.revNo}',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: minPadding),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Price',
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              myBookingData.branch,
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
                                      myBookingData.startTime),
                                  Formatter.convertStringToTimeOfDay(
                                      myBookingData.endTime)),
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
                              myBookingData.courtList.length.toString(),
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
                              "${myBookingData.prices}đ",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: minPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booked court(s)',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 130,
                          height: myBookingData.courtList.length * 35,
                          child: ListView.builder(
                              itemCount: myBookingData.courtList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    textAlign: TextAlign.end,
                                    myBookingData.courtList[index].courtName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
