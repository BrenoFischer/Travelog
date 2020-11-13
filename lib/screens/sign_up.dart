import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/auth_controller.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/text_form_field.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/ui/size_styling.dart';

class SignUpScreen extends GetWidget<AuthController> {
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();
  final _controllerConfirmPass = TextEditingController();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  void handleSubmit() {
    if (_signUpFormKey.currentState.validate()) {
      controller.signUp(
        _controllerEmail.text,
        _controllerPass.text,
        _controllerName.text,
      );
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
      if (value != _controllerConfirmPass.text) {
        return 'As senhas precisam ser iguais.';
      } else {
        return null;
      }
    }
  }

  String passValidatorMatch(String value) {
    if (value != _controllerPass.text) {
      return 'As senhas precisam ser iguais.';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget textFieldsContainer = Container(
      child: Column(
        children: [
          MyTextFormField(
            controller: _controllerName,
            size: size,
            label: "Nome",
            type: "name",
          ),
          Container(
            margin: EdgeInsets.only(top: AppStyles.smallPadding),
            child: MyTextFormField(
              controller: _controllerEmail,
              size: size,
              label: "Email",
              type: "email",
              validator: emailValidator,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: AppStyles.smallPadding,
            ),
            child: MyTextFormField(
              controller: _controllerPass,
              size: size,
              label: "Senha",
              type: "pass",
              validator: passValidator,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: AppStyles.smallPadding,
              top: AppStyles.smallPadding,
            ),
            child: MyTextFormField(
              controller: _controllerConfirmPass,
              size: size,
              label: "Confirmar Senha",
              type: "pass",
              validator: passValidatorMatch,
            ),
          ),
        ],
      ),
    );

    Widget buttonContainer = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: AppStyles.smallPadding),
          child: RoundButton(
            text: "Cadastrar",
            onPress: handleSubmit,
            style: true,
            width: AppStyles.buttonWidth * 1.4,
            fontSize: AppStyles.buttonText,
          ),
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(
        title: "Cadastro",
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/passaport.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _signUpFormKey,
            child: Container(
              margin: EdgeInsets.only(top: AppStyles.bigPadding),
              child: Column(
                children: [
                  textFieldsContainer,
                  buttonContainer,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
