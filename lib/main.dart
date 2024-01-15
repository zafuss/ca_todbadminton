import 'package:ca_todbadminton/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: MainScreen.routeName,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const MainScreen(),
    );
  }
}

class DrawerController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}

class MyDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final DrawerController drawerController = DrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: drawerController.openDrawer,
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final DrawerController drawerController = DrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Second Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: drawerController.openDrawer,
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Second Page'),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Get.offAll(() => HomePage());
            },
          ),
          ListTile(
            title: Text('Second Page'),
            onTap: () {
              Get.offAll(() => SecondPage());
            },
          ),
        ],
      ),
    );
  }
}
