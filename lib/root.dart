import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelog/auth_controller.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:travelog/screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().userEmail != null)
          ? WelcomeScreen()
          : Login();
    });
  }
}
