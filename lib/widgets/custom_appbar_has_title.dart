import 'package:ca_todbadminton/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomHasTitleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final title;
  const CustomHasTitleAppbar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      actions: [
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
