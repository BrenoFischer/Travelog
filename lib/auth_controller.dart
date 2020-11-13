import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travelog/screens/login.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  String get userEmail => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void signUp(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Erro ao criar usuário",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Erro ao fazer login",
        e.message,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void signOut() async {
    try {
      _auth.signOut();
      Get.offAll(Login());
    } catch (e) {
      Get.snackbar(
        "Erro ao sair",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
