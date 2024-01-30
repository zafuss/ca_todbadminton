import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:ca_todbadminton/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});
  static const String routeName = '/mybooking';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const MyBookingScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  var myBookingController = Get.put(MyBookingController());
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        // myBookingController.dispose();
        // myBookingController = Get.put(MyBookingController());
        myBookingController.resetData();
        await myBookingController.fetchResult();
      },
      child: Scaffold(body: Obx(
        () {
          return myBookingController.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: largePadding, vertical: minPadding / 2),
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
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius * 2)),
                        child: ListTile(
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              Get.to(MyBookingDetails(
                                  myBookingData: myBookingController
                                      .myBookingData[index]));
                            },
                          ),
                          title: Text(
                            myBookingController
                                .myBookingData[index].bookingDate,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                          ),
                          subtitle: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    myBookingController
                                        .myBookingData[index].startTime,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    ' - ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    myBookingController
                                        .myBookingData[index].endTime,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  itemCount: myBookingController.myBookingData.length,
                );
        },
      )),
    );
  }

  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
