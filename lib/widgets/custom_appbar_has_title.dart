import 'package:ca_todbadminton/config/theme.dart';
import 'package:ca_todbadminton/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHasTitleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final Function()? backFunc;
  final Function()? menuFunc;
  final CustomDrawerController? controller;
  const CustomHasTitleAppbar(
      {super.key, this.title, this.backFunc, this.menuFunc, this.controller});

  @override
  Widget build(BuildContext context) {
    final mainScreenController = Get.put(MainScreenController());
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        SizedBox(
          height: statusBarHeight,
        ),
        Container(
          height: 65,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: minPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backFunc != null
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          backFunc!();
                        },
                      )
                    : SizedBox(
                        width: 49,
                      ),
                Expanded(
                  child: Center(
                    child: title != null
                        ? Text(
                            title!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                          )
                        : Obx(() =>
                            mainScreenController.currentPageIndex.value == 0
                                ? Text(
                                    'Book Court',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    'My Booking',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                  )),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    controller!.openDrawer();
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, LoginScreen.routeName, (route) => false);
                    // menuFunc != null ? menuFunc!() : null;
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
