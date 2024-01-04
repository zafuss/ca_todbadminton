import 'package:ca_todbadminton/config/theme.dart';
import 'package:ca_todbadminton/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomHasTitleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final title;
  final Function()? backFunc;
  const CustomHasTitleAppbar({
    super.key,
    this.title,
    this.backFunc,
  });

  @override
  Widget build(BuildContext context) {
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
                        width: 36,
                      ),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false);
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
