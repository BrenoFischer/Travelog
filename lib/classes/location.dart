import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key key, this.name, this.lat, this.lng}) : super(key: key);
  final String name;
  final double lat;
  final double lng;

  double getLat() {
    return lat;
  }

  double getLng() {
    return lng;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
