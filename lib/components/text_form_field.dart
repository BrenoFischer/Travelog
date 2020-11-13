import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelog/ui/constants.dart';

class MyTextFormField extends StatefulWidget {
  MyTextFormField({
    Key key,
    this.controller,
    this.size,
    this.label,
    this.icon,
    this.validator,
    this.type,
  }) : super(key: key);

  final TextEditingController controller;
  final Size size;
  final String label;
  final Icon icon;
  final Function validator;
  final String type;

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool _isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: widget.size.width * 0.05,
          right: widget.size.width * 0.05,
          bottom: widget.size.width * 0.05),
      child: TextFormField(
          decoration: InputDecoration(
            helperText: ' ',
            helperStyle: TextStyle(fontSize: 16),
            errorStyle: TextStyle(fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: widget.icon == null ? null : widget.icon,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.white,
            filled: true,
            labelText: widget.label,
            labelStyle:
                TextStyle(color: primaryColor, fontSize: 20, letterSpacing: 2),
            suffixIcon: widget.type != 'pass'
                ? null
                : IconButton(
                    icon: _isPassVisible
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(() {
                        _isPassVisible = !_isPassVisible;
                      });
                    },
                  ),
          ),
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.type != 'pass' ? false : !_isPassVisible),
    );
  }
}
