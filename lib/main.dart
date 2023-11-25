import 'package:ca_todbadminton/screens/screens.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: LoginScreen.routeName,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const LoginScreen(),
    );
  }
}
