import 'package:flutter/material.dart';
import 'package:travelog/classes/location.dart';
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

  String formatDiaryFirstPageTitle() {
    final String place = this.getTitle();
    final Date firstDate = this.getFirstDate();
    final Date lastDate = this.getLastDate();
    final String d1 = firstDate.getInitialDay().toString();
    final String m1 = firstDate.getInitialMonth().toString();
    final int yInt = firstDate.getInitialYear();
    final String y1 =
        yInt > 2000 ? (yInt - 2000).toString() : (yInt - 1900).toString();

    final String d2 = lastDate.getInitialDay().toString();
    final String m2 = lastDate.getInitialMonth().toString();
    final int yInt2 = lastDate.getInitialYear();
    final String y2 =
        yInt > 2000 ? (yInt2 - 2000).toString() : (yInt2 - 1900).toString();

    return (place +
        " - (" +
        d1 +
        "/" +
        m1 +
        "/" +
        y1 +
        " - " +
        d2 +
        "/" +
        m2 +
        "/" +
        y2 +
        ")");
  }

  List<Location> getAllLocations() {
    List<Location> locations = new List();
    List<Location> location = new List();
    int k = pages.length;
    for (int i = 0; i < k; i++) {
      location = pages[i].getLocations();
      locations.addAll(location);
    }
    return locations;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
