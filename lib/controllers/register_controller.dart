import 'dart:convert';

import 'package:ca_todbadminton/config/config.dart';
import 'package:ca_todbadminton/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var phoneNumberController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var fullNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var repeatPasswordController = TextEditingController().obs;
  var userNameControler = TextEditingController().obs;

  void register() async {
    try {
      isLoading(true);
      var body = jsonEncode({
        "PhoneNumber": phoneNumberController.value.text,
        "Email": emailController.value.text,
        "FullName": fullNameController.value.text,
        "_Password": passwordController.value.text,
        "Username": userNameControler.value.text,
        "_Status": "active"
      });

      if (phoneNumberController.value.text == '' ||
          fullNameController.value.text == '' ||
          emailController.value.text == "" ||
          userNameControler.value.text == '' ||
          passwordController.value.text == '' ||
          repeatPasswordController.value.text == '') {
        isLoading(false);
        Get.snackbar('Register Failed', 'Please fill all the fields',
            backgroundColor: Colors.redAccent, colorText: Colors.white);
        return;
      } else if (passwordController.value.text !=
          repeatPasswordController.value.text) {
        isLoading(false);
        Get.snackbar(
            'Register Failed', 'Password and Repeat Password must be the same!',
            backgroundColor: Colors.redAccent, colorText: Colors.white);
        return;
      } else {
        var res = await post(
            Uri.parse(
                "https://badminton-backend.onrender.com/v1/auth/register/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);
        print(res.statusCode);
        if (res.statusCode == 200) {
          isLoading(false);
          Get.snackbar(
              'Register Successfully', 'Navigate to Sign in to login the app.',
              backgroundColor: primaryColor, colorText: Colors.white);
        } else {
          isLoading(false);
          Get.snackbar('Register Failed', json.decode(res.body)['error'],
              backgroundColor: Colors.redAccent, colorText: Colors.white);
        }
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar('Register Failed', e.toString());
    }
  }
}
