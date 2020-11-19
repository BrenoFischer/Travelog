import 'package:travelog/classes/diary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  MyUser({this.id, this.name, this.email, this.diaries});
  String id;
  String name;
  String email;
  List<Diary> diaries;

  MyUser.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    name = documentSnapshot['name'];
    email = documentSnapshot['email'];
  }
}
