import 'package:flutter/material.dart';
import 'package:travelog/authentication_service.dart';
import 'package:travelog/components/text_form_field.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/screens/sign_up.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPass = TextEditingController();
  String login = "";
  String pass = "";

  void handleSubmit(BuildContext context) {
    setState(() {
      login = _controllerLogin.text;
      pass = _controllerPass.text;
      if (_signInFormKey.currentState.validate()) {
        context.read<AuthenticationService>().signIn(
              email: _controllerLogin.text,
              password: _controllerPass.text,
            );
      }
    });
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _signInFormKey,
            child: Column(
              children: <Widget>[
                LogoImage(),
                MyTextFormField(
                  controller: _controllerLogin,
                  size: size,
                  label: "Email",
                  icon: Icon(Icons.alternate_email),
                  validator: emailValidator,
                ),
                MyTextFormField(
                  controller: _controllerPass,
                  size: size,
                  label: "Senha",
                  icon: Icon(Icons.lock_outline),
                  validator: passValidator,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        child: RoundButton(
                          text: "Entrar",
                          onPress: () => handleSubmit(context),
                          style: true,
                          size: 15.0,
                          width: size.width * 0.4,
                          fontSize: 18,
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
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
