import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../screens/screens.dart';
import '../services/hive_helpers.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LocalDataController localDataController =
        Get.put(LocalDataController());
    return Drawer(
      child: Obx(() => localDataController.customer.value != null
          ? SafeArea(
              child: Column(
                children: [
                  Text(
                    localDataController.customer.value!.username,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offAndToNamed(LoginScreen.routeName);
                        HiveHelper.deleteSavedData();
                      },
                      child: Text('Logout'))
                ],
              ),
            )
          : Text('chua co gi het')),
    );
  }
}
