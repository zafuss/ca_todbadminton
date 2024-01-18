import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/screens/screens.dart';
import 'package:ca_todbadminton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../controllers/controllers.dart';

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
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final CustomDrawerController drawerController = CustomDrawerController();
    final key = drawerController.scaffoldKey;
    return Scaffold(
      appBar: CustomHasTitleAppbar(
        title: currentPageIndex == 0 ? 'Book Court' : 'My Booking',
        controller: drawerController,
      ),
      endDrawer: CustomDrawer(),
      key: key,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(minPadding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultBorderRadius * 2),
            child: NavigationBar(
              elevation: 0,
              indicatorColor: primaryColor,
              height: 58,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              backgroundColor: primaryColor,
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              destinations: const [
                NavigationDestination(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    selectedIcon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(
                      Icons.article_outlined,
                      color: Colors.white,
                    ),
                    selectedIcon: Icon(
                      Icons.article,
                      color: Colors.white,
                    ),
                    label: 'My Booking'),
              ],
            ),
          ),
        ),
      ),
      body: [const HomeScreen(), const MyBookingScreen()][currentPageIndex],
    );
  }
}
