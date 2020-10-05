import 'package:flutter/material.dart';
import 'package:travelog/components/text_field.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/screens/sign_up.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _controllerLogin = TextEditingController();
  final _controllerPass = TextEditingController();
  String login = "";
  String pass = "";

  void handleSubmit() {
    setState(() {
      login = _controllerLogin.text;
      pass = _controllerPass.text;
      print(login);
      print(pass);
      Navigator.pushReplacementNamed(
        context,
        "/welcome",
      );
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
      body: Center(
        child: ListView(
          children: <Widget>[
            LogoImage(),
            MyTextField(
              controller: _controllerLogin,
              size: size,
              label: "Email",
              icon: Icon(Icons.alternate_email),
            ),
            MyTextField(
                controller: _controllerPass,
                size: size,
                label: "Senha",
                icon: Icon(Icons.lock_outline)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: RoundButton(
                    text: "Entrar",
                    onPress: handleSubmit,
                    style: true,
                    size: 15.0,
                    width: size.width * 0.4,
                  ),
                ),
                RoundButton(
                  text: "Cadastrar",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                  style: false,
                  size: 15.0,
                  width: size.width * 0.4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Image.asset(
        'assets/images/logo2.png',
        scale: 2.5,
      ),
    );
  }
}
