import 'package:flutter/material.dart';
import 'package:travelog/authentication_service.dart';
import 'package:travelog/components/text_form_field.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/screens/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:travelog/ui/size_styling.dart';

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
          ),
          MyTextFormField(
            controller: _controllerPass,
            size: size,
            label: "Senha",
            icon: Icon(Icons.lock_outline),
            validator: passValidator,
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
              onPress: () => handleSubmit(context),
              style: true,
              width: AppStyles.buttonWidth,
              fontSize: AppStyles.buttonText,
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
            width: AppStyles.buttonWidth,
            fontSize: AppStyles.buttonText,
          ),
        ],
      ),
    );

    return Scaffold(
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
