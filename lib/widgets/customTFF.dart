import 'package:flutter/material.dart';

import '../config/config.dart';

TextFormField CustomTFF({required BuildContext context,  required String title, bool isPassword = false}) {
  return TextFormField(
      obscureText: isPassword,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : SizedBox(),
          contentPadding: EdgeInsets.only(top: 0, left: 8),
          constraints: BoxConstraints(
            maxHeight: 48,
          ),
          hintText: title,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius))));
}