import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/ui/constants.dart';

class MySnackbar {
  static void callSnackbar(String title, String message, String position) {
    Get.snackbar(
      title,
      message,
      snackPosition:
          position == 'top' ? SnackPosition.TOP : SnackPosition.BOTTOM,
      duration: Duration(seconds: 7),
      isDismissible: true,
      barBlur: 30,
      backgroundColor: secondaryColor,
      margin: EdgeInsets.all(20),
      colorText: Colors.white,
    );
  }
}
