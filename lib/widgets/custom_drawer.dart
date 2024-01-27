import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/app_local_data_controller.dart';
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
    localDataController.getCustomer();
    return Drawer(
      child: Obx(() => localDataController.isLoading.isFalse
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: minPadding),
                child: Column(
                  children: [
                    Card(
                      color: primaryColor,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          localDataController.customer!.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          localDataController.customer!.username,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offAndToNamed(LoginScreen.routeName);
                          HiveHelper.deleteSavedData();
                        },
                        child: Text('Logout'))
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}
