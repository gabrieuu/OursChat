import 'package:chat_app/controllers/login_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          TextButton(
          onPressed: () => loginController.toggleIsLogin(), 
          child: Obx(() => Text(loginController.buttonNavbar.value,),)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(loginController.title.value, style: const TextStyle(fontSize: 20),),),
              const SizedBox(height: 20,),
              TextFormField(
                validator: (value) => loginController.validarEmail(value),
                controller: loginController.email,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              TextFormField(
                validator: (value) => loginController.validarSenha(value),
                obscureText: true,
                controller: loginController.password,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Obx(() => (loginController.isLoading.value) 
              ? const CircularProgressIndicator() 
              : ElevatedButton(
                onPressed: () => loginController.validar(),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(200),
                    padding: const EdgeInsets.symmetric(vertical: 20)),
                child: Obx(() => Text(loginController.button.value)),
              ),),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
