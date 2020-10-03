import 'package:flutter/material.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/date.dart';

class Diary extends StatelessWidget {
  const Diary({Key key, this.public, this.title, this.banner, this.pages})
      : super(key: key);
  final bool public;
  final String title;
  final List<DiaryPage> pages;
  final Image banner;

  bool getVisibility() {
    return public;
  }

  String getTitle() {
    return title;
  }

  Image getBanner() {
    return banner;
  }

  Date getFirstDate() {
    return pages[0].getDate();
  }

  Date getLastDate() {
    return pages[pages.length - 1].getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
