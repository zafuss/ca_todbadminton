import 'package:ca_todbadminton/config/config.dart';
import 'package:flutter/material.dart';

class HomeFunctionWidget extends StatelessWidget {
  final String title;
  final Widget childWidget;
  final Icon? icon;
  final void Function()? func;
  const HomeFunctionWidget({
    super.key,
    required this.title,
    required this.childWidget,
    this.icon,
    this.func,
  });

  Widget buildInkWell(childWidget, icon) {
    return InkWell(
      onTap: func,
      child: Container(
        height: defaultWidgetHeight,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                side: const BorderSide(width: 1, color: primaryColor))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Row(
            children: [
              icon != null ? icon! : SizedBox(),
              const SizedBox(
                width: 10,
              ),
              childWidget
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        buildInkWell(childWidget, icon),
      ],
    );
  }
}
