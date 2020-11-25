import 'package:get/get.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/services/database.dart';

class ExploreController extends GetxController {
  Rx<List<Diary>> _exploreList = Rx<List<Diary>>();

  List<Diary> get exploreDiaries => _exploreList.value;

  void setDiary(Stream<List<Diary>> stream) {
    _exploreList.bindStream(stream);
  }

  @override
  void onInit() {
    final Future<List<String>> usersIdFuture = Database().getUsersId();
    usersIdFuture.then((usersId) {
      usersId.forEach((id) {
        Stream<List<Diary>> s1 = Database().diaryStream(id);
        setDiary(s1);
      });
    });
    super.onInit();
  }
}
