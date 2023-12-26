import 'package:ca_todbadminton/screens/screens.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/main';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const MainScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screen = [HomeScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    void _onPageChanged(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(minPadding),
        child: Container(
          color: Colors.transparent,
          height: 58,
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          _selectedIndex = 0;
                          _pageController.jumpToPage(0);
                        },
                        child: Icon(
                          Icons.home_outlined,
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        )),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          _selectedIndex = 1;
                          _pageController.jumpToPage(1);
                        },
                        child: Icon(
                          Icons.person_2_outlined,
                          color: _selectedIndex == 1
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        )),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0C591B1B),
                      // color: primaryColor.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius:
                      BorderRadius.circular(defaultBorderRadius * 2))),
        ),
      ),
    );
  }
}
