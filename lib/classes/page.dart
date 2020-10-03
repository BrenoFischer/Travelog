import 'package:flutter/material.dart';
import 'package:travelog/classes/date.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key key, this.text, this.date}) : super(key: key);
  final String text;
  final Date date;

  Date getDate() {
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
