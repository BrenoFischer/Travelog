import 'package:get/get.dart';
import 'package:travelog/controllers/auth_controller.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/services/database.dart';

class DiaryController extends GetxController {
  Rx<List<Diary>> _diaryList = Rx<List<Diary>>();

  List<Diary> get diaries => _diaryList.value;

  void rebind() {
    String uid = Get.find<AuthController>().user.uid;
    _diaryList.bindStream(Database().diaryStream(uid));
  }

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    _diaryList.bindStream(Database().diaryStream(uid));

    super.onInit();
  }
}
