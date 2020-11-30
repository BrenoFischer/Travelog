import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelog/controllers/auth_controller.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:travelog/screens/login.dart';
import 'package:travelog/services/database.dart';
import 'package:travelog/controllers/user_controller.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    void handleRoot() async {
      Get.find<UserController>().user =
          await Database().getUser(Get.find<AuthController>().user?.uid);
    }

    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          handleRoot();
          return WelcomeScreen();
        } else {
          return Login();
        }
      },
    );
  }
}
