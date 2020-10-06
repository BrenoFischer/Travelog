import 'package:flutter/material.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/factories/location_factory.dart';

class PageFactory extends StatelessWidget {
  const PageFactory({Key key, this.dates}) : super(key: key);
  final List<Date> dates;

  List<DiaryPage> createPages() {
    List<DiaryPage> pages = new List();
    for (int i = 0; i < 3; i++) {
      List<Location> locations = new List();
      if (i == 0) {
        locations = LocationFactory.createLocationPage1();
      } else if (i == 1) {
        locations = LocationFactory.createLocationPage2();
      } else {
        locations = LocationFactory.createLocationPage3();
      }
      pages.add(DiaryPage(
        date: dates[i],
        locations: locations,
      ));
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
