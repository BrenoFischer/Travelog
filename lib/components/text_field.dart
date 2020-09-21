import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelog/constants.dart';

class MyTextField extends StatelessWidget {
  MyTextField({Key key, this.controller, this.size, this.label, this.icon})
      : super(key: key);

  TextEditingController controller;
  Size size;
  String label;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.width * 0.05),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: icon == null ? null : icon,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          labelStyle:
              TextStyle(color: primaryColor, fontSize: 20, letterSpacing: 2),
        ),
        controller: controller,
      ),
    );
  }
}
