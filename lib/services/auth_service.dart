import 'package:chat_app/controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  var userIsAuthenticate = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (User? user) {
      (user != null)
          ? userIsAuthenticate.value = true
          : userIsAuthenticate.value = false;
    });
  }

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  void showSnack(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnack("Erro ao criar usuario", "$e");
    }
  }

  signIn(String email, String password) async{
     try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showSnack("Error in Sign In", "$e");
    }
  }
  logOut() async{
     try {
      UserController.to.userProfile.value = null;
      await _auth.signOut();
    } catch (e) {
      showSnack("erro ao sair", "$e");
    }
  }
}
