import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/classes/my_user.dart';
import 'package:travelog/components/progress_indicator.dart';
import 'package:travelog/controllers/auth_controller.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/ui/size_styling.dart';
import 'package:travelog/controllers/user_controller.dart';

class ProfileScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    Widget circleAvatar = Container(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage("assets/images/profileDefault.jpg"),
          ),
          //GestureDetector(
          //child: Icon(
          //Icons.edit,
          //size: 30,
          //color: primaryColor,
          //),
          //),
        ],
      ),
    );

    Widget userEmailNameContainer(MyUser user) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              user.name,
              style: AppStyles.titleStyleAlternativeColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 150),
            child: Text(
              user.email,
              style: AppStyles.titleStyle,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: MyAppBar(
        title: "Perfil",
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circleAvatar,
            GetX<UserController>(
              builder: (_) {
                if (_.user.email != null) {
                  return userEmailNameContainer(_.user);
                } else {
                  return MyCircularProgressIndicator();
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
      ),
    );
  }
}
