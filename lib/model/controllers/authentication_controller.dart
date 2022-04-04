import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  Future<void> login(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error("User not found");
      } else if (e.code == 'wrong-password') {
        return Future.error("Wrong password");
      }
    }
  }

  Future<void> signup(email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error("The password is too weak");
      } else if (e.code == 'email-already-in-use') {
        return Future.error("The email is taken");
      }
    }
  }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return Future.error("Logout error");
    }
  }
}
