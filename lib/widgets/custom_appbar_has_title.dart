import 'package:flutter/material.dart';

class CustomHasTitleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomHasTitleAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Book Court',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
