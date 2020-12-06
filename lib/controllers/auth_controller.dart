import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travelog/classes/my_user.dart';
import 'package:travelog/components/my_snackbar.dart';
import 'package:travelog/screens/login.dart';
import 'package:travelog/services/database.dart';
import 'package:travelog/controllers/user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void signUp(String email, String password, String name) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      MyUser _user = MyUser(
        id: _authResult.user.uid,
        name: name,
        email: email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      MySnackbar.callSnackbar("Erro ao criar usuário", e.message, "bottom");
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      MySnackbar.callSnackbar(
        "Erro ao fazer login",
        e.message,
        'top',
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
      Get.to(Login());
    } catch (e) {
      MySnackbar.callSnackbar(
        "Erro ao sair",
        e.message,
        "bottom",
      );
    }
  }
}
