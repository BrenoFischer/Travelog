import 'package:flutter/material.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/text_form_field.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/ui/size_styling.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();
  final _controllerConfirmPass = TextEditingController();

  String name = "";
  String email = "";
  String pass = "";
  String confirmPass = "";

  void handleSubmit() {
    setState(() {
      name = _controllerName.text;
      email = _controllerEmail.text;
      pass = _controllerPass.text;
      confirmPass = _controllerConfirmPass.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: AppStyles.bigPadding),
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
                        type: "pass"),
                  ),
                  Row(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
