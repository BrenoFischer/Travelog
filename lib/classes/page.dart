import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/page_map.dart';
import 'package:travelog/components/show_page_map.dart';

class DiaryPage {
  DiaryPage({
    this.pageId,
    this.title,
    this.text,
    this.date,
    this.dateEnd,
    this.dateInit,
    this.locations,
    this.pageMap,
    this.diary,
  });
  String pageId;
  String title;
  Timestamp dateCreated;
  String text;
  Date date;
  String dateEnd;
  String dateInit;
  List<Location> locations;
  PageMap pageMap;
  Diary diary;

  DiaryPage.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    pageId = documentSnapshot.id;
    title = documentSnapshot['title'];
    text = documentSnapshot['text'];
    dateCreated = documentSnapshot['dateCreated'];
    dateEnd = documentSnapshot['dateEnd'];
    dateInit = documentSnapshot['dateInit'];
    locations = List();
  }

  void setLocation(List<Location> locs) {
    locations = locs;
  }

  void setDate(Date d) {
    date = d;
  }

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

  String getTitle() => this.title;
}
