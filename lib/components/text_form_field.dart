import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelog/ui/constants.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    Key key,
    this.controller,
    this.size,
    this.label,
    this.icon,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final Size size;
  final String label;
  final Icon icon;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.width * 0.05),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: icon == null ? null : icon,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          labelStyle:
              TextStyle(color: primaryColor, fontSize: 20, letterSpacing: 2),
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
