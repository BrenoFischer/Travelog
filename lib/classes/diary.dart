import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelog/classes/diary_map.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/my_user.dart';
import 'package:travelog/components/show_diary_map.dart';

class Diary {
  Diary({
    this.diaryId,
    this.userId,
    this.public,
    this.title,
    this.banner,
    this.pages,
    this.user,
    this.diaryMap,
  });
  String diaryId;
  String userId;
  bool public;
  String title;
  List<DiaryPage> pages;
  String banner;
  MyUser user;
  DiaryMap diaryMap;

  Diary.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    diaryId = documentSnapshot.id;
    public = documentSnapshot['public'];
    title = documentSnapshot['title'];
    userId = documentSnapshot['userId'];
    banner = documentSnapshot['banner'];
  }

  void setPages(List<DiaryPage> pags) {
    pages = pags;
  }

  bool getVisibility() {
    return public;
  }

  String getTitle() {
    return title;
  }

  Image getBanner() {
    Image thisBanner;
    this.banner[0] == 'a'
        ? thisBanner = Image.asset(
            this.banner,
            fit: BoxFit.fill,
          )
        : thisBanner = Image.network(
            this.banner,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          );

    return thisBanner;
  }

  Date getFirstDate() {
    return pages[0].getDate();
  }

  Date getLastDate() {
    return pages[pages.length - 1].getDate();
  }

  String getDiaryFirstPageTitle() {
    return this.getTitle();
  }

  String formatDiaryFirstPageDate() {
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

    return (d1 + "/" + m1 + "/" + y1 + " - " + d2 + "/" + m2 + "/" + y2);
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

  Widget showDiaryMap() {
    return ShowDiaryMap(diary: this);
  }

  int getNumberOfPages() {
    return pages.length;
  }
}
