import 'package:flutter/material.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/date.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key key, this.text, this.date, this.locations})
      : super(key: key);
  final String text;
  final Date date;
  final List<Location> locations;

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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
