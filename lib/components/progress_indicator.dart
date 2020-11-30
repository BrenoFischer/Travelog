import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelog/ui/constants.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: primaryColor,
      valueColor: new AlwaysStoppedAnimation<Color>(secondaryColor),
    );
  }
}
