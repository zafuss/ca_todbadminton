import 'package:flutter/material.dart';

import '../config/config.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          backgroundColor: primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline), label: 'Profile')
          ]),
      appBar: const CustomHasTitleAppbar(),
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
                  HomeFunctionWidget(
                    title: 'Branch',
                    icon: const Icon(Icons.place_outlined),
                    childWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Binh Thanh',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                        ),
                        Text(
                          '10 Xo Viet Nghe Tinh, quan Binh Thanh',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  HomeFunctionWidget(
                    title: 'Court',
                    icon: const Icon(Icons.play_arrow_outlined),
                    childWidget: Text(
                      'San 1',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ),
                  HomeFunctionWidget(
                    title: 'Date',
                    icon: const Icon(Icons.calendar_month),
                    childWidget: Text(
                      '02/12/2023',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: HomeFunctionWidget(
                          title: 'Time',
                          icon: const Icon(Icons.access_alarm),
                          childWidget: Text('11:00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                        ),
                      ),
                      const SizedBox(
                        width: minPadding,
                      ),
                      Expanded(
                        child: HomeFunctionWidget(
                          title: 'Time',
                          icon: const Icon(Icons.access_alarm),
                          childWidget: Text('12:00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: minPadding,
                  ),
                  CustomElevatedButton(title: 'Search', onPressed: () {})
                ],
              )),
        ),
      ),
    );
  }
}
