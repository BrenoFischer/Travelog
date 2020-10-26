import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/page_map.dart';
import 'package:travelog/components/show_page_map.dart';

class DiaryPage {
  DiaryPage({
    Key key,
    this.text,
    this.date,
    this.locations,
    this.pageMap,
    this.diary,
  });
  final String text;
  final Date date;
  final List<Location> locations;
  final PageMap pageMap;
  final Diary diary;

  Date getDate() {
    return date;
  }

  String getDateString() {
    return ("(" +
        date.initialDay.toString() +
        "/" +
        date.initialMonth.toString() +
        "/" +
        date.initialYear.toString() +
        " - " +
        date.finalDay.toString() +
        "/" +
        date.finalMonth.toString() +
        "/" +
        date.finalYear.toString() +
        ")");
  }

  List<Location> getLocations() {
    return locations;
  }

  List<String> getLocationsNames() {
    int k = this.locations.length;
    List<String> locationsNames = List();
    if (k > 0) {
      for (int i = 0; i < k; i++) {
        locationsNames.add(this.locations[i].name);
      }
    }
    return locationsNames;
  }

  Widget showPageMap() {
    return ShowPageMap(page: this);
  }
}
