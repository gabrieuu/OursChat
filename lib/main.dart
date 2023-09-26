import 'package:chat_app/auth_check.dart';
import 'package:chat_app/configs_main.dart';
import 'package:flutter/material.dart';

void main() async{
 await configurations();
runApp(const MyApp()); 

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OursChat",   
      theme: ThemeData(
        useMaterial3: true
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      
      home: const AuthCheck()
    );
  }
}