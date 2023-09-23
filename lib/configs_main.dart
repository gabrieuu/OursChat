import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> configurations() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.lazyPut<AuthService>(() => AuthService());
  Get.lazyPut<UserController>(() => UserController());
}