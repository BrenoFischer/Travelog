import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelog/classes/page.dart';

class Location {
  Location({Key key, this.name, this.pageId, this.lat, this.lng, this.pages});
  String name;
  String pageId;
  double lat;
  double lng;
  List<DiaryPage> pages;

  Location.fromDocumentSnapshot(
      DocumentSnapshot documentSnapshot, Map docData, String id) {
    pageId = id;
    lat = docData['latitude'];
    lng = docData['longitude'];
    name = docData['name'];
  }

  double getLat() {
    return lat;
  }

  double getLng() {
    return lng;
  }
}
