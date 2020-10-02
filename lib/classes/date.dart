import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  const Date(
      {Key key,
      this.initialDay,
      this.initialMonth,
      this.initialYear,
      this.finalDay,
      this.finalMonth,
      this.finalYear})
      : super(key: key);
  final int initialDay;
  final int initialMonth;
  final int initialYear;
  final int finalDay;
  final int finalMonth;
  final int finalYear;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
