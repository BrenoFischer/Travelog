import 'package:travelog/classes/diary.dart';

class MyUser {
  MyUser({this.name, this.email, this.senha, this.diaries});
  final String name;
  final String email;
  final String senha;
  final List<Diary> diaries;

  void signUp() {}

  void signIn() {}

  void getDiaries() {}
}
