import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/my_user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  Future<void> createDiary(String uid, String title, String banner) async {
    try {
      await _firestore.collection("users").doc(uid).collection("diaries").add({
        'public': false,
        'title': title,
        'banner': banner,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> createPage(String uid, String diaryId, String title, String text,
      String dateInit, String dateEnd, List<Marker> markers) async {
    try {
      Future<DocumentReference> _pageIdFuture = _firestore
          .collection("users")
          .doc(uid)
          .collection("diaries")
          .doc(diaryId)
          .collection("pages")
          .add({
        'title': title,
        'dateInit': dateInit,
        'dateEnd': dateEnd,
        'text': text,
      });
      _pageIdFuture.then((_pageId) {
        markers.forEach((marker) {
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
              'latitude': marker.position.latitude,
              'longitude': marker.position.longitude,
            });
          } catch (e1) {
            print(e1);
          }
        });
      });
    } catch (e) {
      print(e);
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

  List<Diary> diaryList(String uid) {
    List<Diary> retVal = List();
    _firestore
        .collection("users")
        .doc(uid)
        .collection("diaries")
        .snapshots()
        .map(
      (QuerySnapshot query) {
        query.docs.forEach(
          (element) {
            retVal.add(Diary.fromDocumentSnapshot(element));
          },
        );
      },
    );
    return retVal;
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
}
