import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var title = "Login".obs;
  var button = "SignIn".obs;
  var buttonNavbar = "Register".obs;
  var isLogin = true.obs;
  var isLoading = false.obs; 
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    ever(isLogin, (value) {
      title.value = value ? "Welcome!" : "Create account";
      button.value = value ? "SignIn" : "Register";
      buttonNavbar.value = value ? "Register" : "Login";
      formKey.currentState!.reset();
    });
  }

  void toggleIsLogin(){
    isLogin.value = !isLogin.value;
  }

  String? validarEmail(String? email) =>
  (email != null && email.isNotEmpty) ? null : "Preencha o email!";

  String? validarSenha(String? senha) => 
  (senha != null && senha.length > 6) ? null : "Senha deve ser maior que 6";

  void validar(){
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      isLogin.value ? login() : register();
    }
  }

  void login() async{
    isLoading.value = true;
    await AuthService.to.signIn(email.text, password.text);
    isLoading.value = false;
  }

  void register() async{
    isLoading.value = true;
    await AuthService.to.createUser(email.text, password.text);
    await UserController.to.saveUsers();
    isLoading.value = false;
  }
}