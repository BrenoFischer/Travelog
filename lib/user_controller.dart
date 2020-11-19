import 'package:get/get.dart';
import 'package:travelog/classes/my_user.dart';

class UserController extends GetxController {
  Rx<MyUser> _myUser = MyUser().obs;

  MyUser get user => _myUser.value;

  set user(MyUser value) => this._myUser.value = value;

  void clear() {
    _myUser.value = MyUser();
  }
}
