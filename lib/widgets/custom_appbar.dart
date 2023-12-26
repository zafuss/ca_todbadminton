import 'package:ca_todbadminton/config/config.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 63,
          ),
          Padding(
            padding: const EdgeInsets.only(left: largePadding),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 238, 242, 1),
                      borderRadius: BorderRadius.circular(defaultBorderRadius)),
                  child: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                    size: 20,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}
