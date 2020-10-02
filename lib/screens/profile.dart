import 'package:flutter/material.dart';
import 'package:travelog/components/my_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Perfil",
      ),
    );
  }
}
