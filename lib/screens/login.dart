import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/controllers/auth_controller.dart';
import 'package:travelog/components/text_form_field.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/screens/sign_up.dart';
import 'package:travelog/ui/size_styling.dart';

class Login extends GetWidget<AuthController> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPass = TextEditingController();

  void handleSubmit() {
    if (_signInFormKey.currentState.validate()) {
      controller.login(_controllerLogin.text, _controllerPass.text);
    }
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Formato de e-mail inválido.';
    } else {
      return null;
    }
  }

  String passValidator(String value) {
    if (value.length < 6) {
      return 'A senha precisa ter pelo menos 6 caracteres.';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget logoImage = Container(
      margin: EdgeInsets.only(bottom: AppStyles.mediumPadding),
      child: Image.asset(
        'assets/images/logo2.png',
        scale: 2.5,
      ),
    );

    Widget textFieldContainer = Container(
      margin: EdgeInsets.only(
        top: AppStyles.smallPadding,
        bottom: AppStyles.smallPadding,
      ),
      child: Column(
        children: [
          MyTextFormField(
            controller: _controllerLogin,
            size: size,
            label: "Email",
            icon: Icon(Icons.alternate_email),
            validator: emailValidator,
            type: 'email',
          ),
          MyTextFormField(
            controller: _controllerPass,
            size: size,
            label: "Senha",
            icon: Icon(Icons.lock_outline),
            validator: passValidator,
            type: 'pass',
          ),
        ],
      ),
    );

    Widget buttonsContainer = Container(
      margin: EdgeInsets.only(top: AppStyles.smallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: AppStyles.smallPadding),
            child: RoundButton(
              text: "Entrar",
              onPress: () => handleSubmit(),
              style: true,
              width: AppStyles.buttonWidth,
              fontSize: AppStyles.buttonText,
            ),
          ),
          RoundButton(
            text: "Cadastrar",
            onPress: () => Get.to(SignUpScreen()),
            style: false,
            width: AppStyles.buttonWidth,
            fontSize: AppStyles.buttonText,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _signInFormKey,
            child: Column(
              children: <Widget>[
                logoImage,
                textFieldContainer,
                buttonsContainer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
