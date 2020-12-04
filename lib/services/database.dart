import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/my_user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelog/classes/page.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(MyUser user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<MyUser> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      return MyUser.fromDocumentSnapshot(_doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<DiaryPage>> getPages(String uid, String diaryId) async {
    try {
      List<DiaryPage> _pages = List();
      QuerySnapshot _query = await _firestore
          .collection("users")
          .doc(uid)
          .collection("diaries")
          .doc(diaryId)
          .collection("pages")
          .orderBy("dateCreated", descending: false)
          .get();
      _query.docs.forEach((page) {
        _pages.add(DiaryPage.fromDocumentSnapshot(page));
      });
      return _pages;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Location>> getMarkers(
      String uid, String diaryId, String pageId) async {
    try {
      List<Location> _markers = List();
      QuerySnapshot _query = await _firestore
          .collection("users")
          .doc(uid)
          .collection("diaries")
          .doc(diaryId)
          .collection("pages")
          .doc(pageId)
          .collection("markers")
          .get();
      _query.docs.forEach((marker) {
        _markers
            .add(Location.fromDocumentSnapshot(marker, marker.data(), pageId));
      });
      return _markers;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<int> getNumberOfPages(String uid, String diaryId) async {
    try {
      QuerySnapshot _query = await _firestore
          .collection("users")
          .doc(uid)
          .collection("diaries")
          .doc(diaryId)
          .collection("pages")
          .get();

      return _query.docs.length;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<void> createDiary(String uid, String title, String banner) async {
    try {
      await _firestore.collection("users").doc(uid).collection("diaries").add({
        'public': false,
        'title': title,
        'banner': banner,
        'userId': uid,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> createPage(
      String uid,
      String diaryId,
      String title,
      String text,
      String dateInit,
      String dateEnd,
      List<Marker> markers,
      List<String> names) async {
    try {
      Future<DocumentReference> _pageIdFuture = _firestore
          .collection("users")
          .doc(uid)
          .collection("diaries")
          .doc(diaryId)
          .collection("pages")
          .add({
        'dateCreated': Timestamp.now(),
        'title': title,
        'dateInit': dateInit,
        'dateEnd': dateEnd,
        'text': text,
      });
      _pageIdFuture.then((_pageId) {
        for (int i = 0; i < markers.length; i++) {
          try {
            _firestore
                .collection("users")
                .doc(uid)
                .collection("diaries")
                .doc(diaryId)
                .collection("pages")
                .doc(_pageId.id)
                .collection("markers")
                .add({
              'latitude': markers[i].position.latitude,
              'longitude': markers[i].position.longitude,
              'name': names[i],
            });
          } catch (e1) {
            print(e1);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<Diary>> getDiaries(String uid) async {
    try {
      List<Diary> _diaries = List();
      QuerySnapshot _query = await _firestore
          .collection("users")
          .doc(uid)
          .collection("diaries")
          .get();
      _query.docs.forEach((diary) {
        _diaries.add(Diary.fromDocumentSnapshot(diary));
      });
      return _diaries;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<Diary>> diaryStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("diaries")
        .snapshots()
        .map(
      (QuerySnapshot query) {
        List<Diary> retVal = List();
        query.docs.forEach(
          (element) {
            retVal.add(Diary.fromDocumentSnapshot(element));
          },
        );
        return retVal;
      },
    );
  }

  Future<List<String>> getUsersId() async {
    List<String> usersKey = List();
    QuerySnapshot usersResult = await _firestore.collection("users").get();
    final List<DocumentSnapshot> users = usersResult.docs;
    int count = 0;

    for (final user in users) {
      if (count > 10) {
        break;
      }
      usersKey.add(user.id);
      count += 1;
    }
    return usersKey;
  }

  Future<void> changeDiaryVisibility(
      String uid, String diaryId, bool newVisibility) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("diaries")
          .doc(diaryId)
          .update({"public": newVisibility});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
