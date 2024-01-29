import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/controllers/app_local_data_controller.dart';
import 'package:ca_todbadminton/services/share_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LocalDataController localDataController =
        Get.find<LocalDataController>();
    return Drawer(
      child: Obx(() => localDataController.isLoading.isFalse
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: minPadding),
                child: RefreshIndicator(
                  onRefresh: () async {
                    return Future.delayed(Duration(seconds: 2));
                  },
                  child: ListView(
                    children: [
                      Card(
                        color: primaryColor,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            localDataController.customer.value.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            localDataController.customer.value.username,
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
                            SharePrefs.deleteCustomerDataFromLocal();
                            Get.deleteAll();
                          },
                          child: Text('Logout'))
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}
