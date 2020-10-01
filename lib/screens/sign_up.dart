import 'package:flutter/material.dart';
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
      appBar: AppBar(
        elevation: 0,
        title: Text("Cadastro"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView(
          children: [
            MyTextField(
              controller: _controllerName,
              size: size,
              label: "Nome",
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 50),
              child: MyTextField(
                controller: _controllerEmail,
                size: size,
                label: "Email",
              ),
            ),
            MyTextField(
              controller: _controllerPass,
              size: size,
              label: "Senha",
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
                    width: size.width * 0.4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
