import 'package:flutter/material.dart';
import 'package:travelog/classes/date.dart';

abstract class DateFactory extends StatelessWidget {
  static List<Date> createDates() {
    List<Date> d = new List();
    d.add(Date(
        initialDay: 20,
        initialMonth: 12,
        initialYear: 2018,
        finalDay: 21,
        finalMonth: 12,
        finalYear: 2018));
    d.add(Date(
        initialDay: 21,
        initialMonth: 12,
        initialYear: 2018,
        finalDay: 25,
        finalMonth: 12,
        finalYear: 2018));
    d.add(Date(
        initialDay: 30,
        initialMonth: 12,
        initialYear: 2018,
        finalDay: 10,
        finalMonth: 01,
        finalYear: 2019));
    return d;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
