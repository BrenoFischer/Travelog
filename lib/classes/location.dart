import 'package:flutter/material.dart';

class Location {
  Location({Key key, this.name, this.lat, this.lng});
  final String name;
  final double lat;
  final double lng;

  double getLat() {
    return lat;
  }

  double getLng() {
    return lng;
  }
}
