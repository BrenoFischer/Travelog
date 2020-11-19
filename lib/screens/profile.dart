import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/auth_controller.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/ui/size_styling.dart';
import 'package:travelog/user_controller.dart';

class ProfileScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Perfil",
      ),
      body: Column(
        children: [
          GetX<UserController>(
            builder: (_) {
              if (_.user.email != null) {
                return Text(_.user.email);
              } else {
                return Text("Carregando ...");
              }
            },
          ),
          RoundButton(
            text: "Sair",
            onPress: controller.signOut,
            style: true,
            width: AppStyles.buttonWidth * 1.4,
            fontSize: AppStyles.buttonText,
          ),
        ],
      ),
    );
  }
}
