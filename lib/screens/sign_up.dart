import 'package:flutter/material.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/text_field.dart';
import 'package:travelog/components/round_button.dart';

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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/passaport.png',
                  scale: 1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    MyTextField(
                      controller: _controllerName,
                      size: size,
                      label: "Nome",
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: MyTextField(
                        controller: _controllerEmail,
                        size: size,
                        label: "Email",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 60),
                      child: MyTextField(
                        controller: _controllerPass,
                        size: size,
                        label: "Senha",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 20.0),
                          child: RoundButton(
                            text: "Cadastrar",
                            onPress: handleSubmit,
                            style: true,
                            size: 15.0,
                            width: size.width * 0.6,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
