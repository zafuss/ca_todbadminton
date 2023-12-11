import 'package:ca_todbadminton/formatter.dart';
import 'package:ca_todbadminton/controllers/booking_information_controller.dart';
import 'package:ca_todbadminton/controllers/branch_controller.dart';
import 'package:ca_todbadminton/models/branch_model.dart';
import 'package:ca_todbadminton/screens/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../config/config.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final branchController = Get.put(BranchController());
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    final bookingInformationController = Get.put(BookingInformation());
    print(bookingInformationController.startTime.obs.string);

    final SimpleDialog dialog = SimpleDialog(
      title: Text('Choose branch'),
      children: Branch.branches
          .map((e) => SimpleDialogBranchItem(branch: e))
          .toList(),
    );

    return Scaffold(
      appBar: const CustomHasTitleAppbar(
        title: 'Book Court',
      ),
      body: Padding(
        padding: const EdgeInsets.all(largePadding),
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
              borderRadius: BorderRadius.circular(defaultBorderRadius * 2)),
          child: Padding(
              padding: const EdgeInsets.only(
                  left: minPadding,
                  right: minPadding,
                  bottom: minPadding,
                  top: minPadding / 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => HomeFunctionWidget(
                      func: () {
                        if (branchController.isLoading.value)
                          CircularProgressIndicator();
                        else {
                          showDialog<void>(
                              context: context, builder: (context) => dialog);
                        }
                      },
                      title: 'Branch',
                      icon: const Icon(Icons.place_outlined),
                      childWidget: bookingInformationController
                                  .branchName.value !=
                              ''
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookingInformationController.branchName.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                ),
                                Text(
                                  bookingInformationController.address.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 10),
                                )
                              ],
                            )
                          : Text(
                              'Choose a branch',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                    ),
                  ),
                  Obx(
                    () => HomeFunctionWidget(
                      func: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: dateFormat.parse(
                              bookingInformationController.bookingDate.string),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          print(pickedDate);
                          bookingInformationController
                              .updateBookingDate(pickedDate);
                        }
                      },
                      title: 'Date',
                      icon: const Icon(Icons.calendar_month),
                      childWidget: Text(
                        bookingInformationController.bookingDate.string,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                            child: HomeFunctionWidget(
                          func: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: Formatter.convertStringToTimeOfDay(
                                    bookingInformationController
                                        .startTime.value));

                            bookingInformationController
                                .updateStartTime(pickedTime);
                          },
                          title: 'Start Time',
                          icon: const Icon(Icons.access_alarm),
                          childWidget: Text(
                              bookingInformationController.startTime.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                        )),
                        const SizedBox(
                          width: minPadding,
                        ),
                        Expanded(
                            child: HomeFunctionWidget(
                          func: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: Formatter.convertStringToTimeOfDay(
                                    bookingInformationController
                                        .startTime.value));

                            bookingInformationController
                                .updateEndTime(pickedTime);
                          },
                          title: 'End Time',
                          icon: const Icon(Icons.access_alarm),
                          childWidget: Text(
                              bookingInformationController.endTime.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: minPadding,
                  ),
                  CustomElevatedButton(
                      title: 'Search',
                      onPressed: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      })
                ],
              )),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
