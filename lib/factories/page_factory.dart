import 'package:flutter/material.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/page.dart';

class PageFactory extends StatelessWidget {
  const PageFactory({Key key, this.dates}) : super(key: key);
  final List<Date> dates;

  List<DiaryPage> createPages() {
    List<DiaryPage> pages = new List();
    for (int i = 0; i < 3; i++) {
      pages.add(DiaryPage(date: dates[i]));
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
