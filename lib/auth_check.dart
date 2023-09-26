import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view/home_page/home_page.dart';
import 'package:chat_app/view/login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticate.value ? const HomePage() : LoginPage());
  }
}