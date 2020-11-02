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

  String name = "";
  String email = "";
  String pass = "";

  void handleSubmit() {
    setState(() {
      name = _controllerName.text;
      email = _controllerEmail.text;
      pass = _controllerPass.text;
      print(name);
      print(email);
      print(pass);
      //if (_controllerLogin.text.isNotEmpty && _controllerPass.text.isNotEmpty) {
      //_controllerLogin.clear();
      //_controllerPass.clear();
      //}
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
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppStyles.smallPadding),
                    child: MyTextFormField(
                      controller: _controllerEmail,
                      size: size,
                      label: "Email",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: AppStyles.smallPadding,
                      bottom: AppStyles.mediumPadding,
                    ),
                    child: MyTextFormField(
                      controller: _controllerPass,
                      size: size,
                      label: "Senha",
                    ),
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
