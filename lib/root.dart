import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelog/auth_controller.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:travelog/screens/login.dart';
import 'package:travelog/user_controller.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return WelcomeScreen();
        } else {
          return Login();
        }
      },
    );
  }
}
