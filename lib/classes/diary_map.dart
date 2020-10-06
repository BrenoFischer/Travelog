import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DiaryMap extends StatelessWidget {
  DiaryMap({this.diary});
  final Diary diary;

  Set<Marker> markers = new Set<Marker>();
  List<Location> locations = List<Location>();

  Set<Marker> getMarkers() {
    locations = diary.getAllLocations();
    int k = locations.length;
    for (int i = 0; i < k; i++) {
      double lati = locations[i].getLat();
      double lngi = locations[i].getLng();
      LatLng position = LatLng(lati, lngi);
      String markerId = lati.toString() + lngi.toString() + locations[i].name;

      final Marker marker = new Marker(
        markerId: new MarkerId(markerId),
        position: position,
      );
      markers.add(marker);
    }
    return markers;
  }

  Location getInitialLocation() {
    locations = diary.getAllLocations();
    return locations[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
