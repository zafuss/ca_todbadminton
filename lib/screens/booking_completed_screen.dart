import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingCompleted extends StatelessWidget {
  const BookingCompleted({super.key});

  static const String routeName = '/bookingcompleted';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const BookingCompleted(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 75,
          child: TextButton(
            onPressed: () {
              Get.offAndToNamed(MainScreen.routeName);
            },
            child: Text('Back to Home Screen'),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: minPadding),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Image.asset(
                  'assets/images/check_mark.gif',
                  height: 100,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: largePadding),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking Completed!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Thank you for choosing our service!\nHope you always have good health.',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
