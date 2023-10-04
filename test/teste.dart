import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/model/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main(){
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  test("deve retornar um usuario", () {
    final controller = Get.put(UserController());
    UserProfile? user = controller.getUserById("0bJhNlj9YmXI5IQlt9iFTQ6ZyYg1");

    if(user != null){
      expect("Lyvia", user.userName);
    }

  });
}