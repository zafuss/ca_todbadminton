import 'package:ca_todbadminton/controllers/bot_navbar_controller.dart';
import 'package:ca_todbadminton/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';

class CustomBotNavBar extends StatelessWidget {
  const CustomBotNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final botNavController = BotNavBarController();
    return Padding(
      padding: const EdgeInsets.all(minPadding),
      child: Container(
        color: Colors.transparent,
        height: 58,
        child: Container(
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
                borderRadius: BorderRadius.circular(defaultBorderRadius * 2)),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          botNavController.currentPageIndex.value = 0;
                          Get.toNamed(HomeScreen.routeName);
                        },
                        child: Icon(
                          Icons.home_outlined,
                          color: botNavController.currentPageIndex.value == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        )),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          botNavController.currentPageIndex.value = 1;
                          Get.toNamed(ProfileScreen.routeName);
                        },
                        child: Icon(
                          Icons.person_2_outlined,
                          color: botNavController.currentPageIndex.value == 1
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
