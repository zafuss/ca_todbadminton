import 'package:flutter/material.dart';

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

class _MyBookingScreenState extends State<MyBookingScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Text('My Booking'),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
