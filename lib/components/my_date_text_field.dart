import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:travelog/ui/constants.dart';
import 'package:travelog/ui/size_styling.dart';

class MyDateTextField extends StatelessWidget {
  MyDateTextField({this.title, this.format, this.controller});
  final String title;
  final DateFormat format;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: AppStyles.dateFieldStyle,
          ),
          DateTimeField(
            controller: controller,
            decoration: InputDecoration(
              helperText: ' ',
              helperStyle: TextStyle(fontSize: 16),
              errorStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            format: format,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
        ],
      ),
    );
  }
}
