import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/view/home_page.dart';
import 'package:chat_app/view/login_page/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());

  FirebaseFirestore.instance.collection("message").doc("msg1").snapshots().listen((event) { 
    print(event.data());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "OursChat",
      
      theme: ThemeData(
        useMaterial3: true
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}