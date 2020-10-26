import 'package:flutter/material.dart';
import 'package:travelog/classes/page.dart';

class Location {
  Location({Key key, this.name, this.lat, this.lng, this.pages});
  final String name;
  final double lat;
  final double lng;
  final List<DiaryPage> pages;

  double getLat() {
    return lat;
  }

  double getLng() {
    return lng;
  }
}
