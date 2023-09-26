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
    Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: 'User Registered Successfully',
      icon: const Icon(Icons.refresh),
      duration: const Duration(seconds: 3),
    ),
);
  }

  createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  signIn(String email, String password) async{
     try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
  logOut() async{
     try {
      UserController.to.userProfile.value = null;
      await _auth.signOut();
    } on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
}
