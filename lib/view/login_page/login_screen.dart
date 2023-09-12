import 'package:chat_app/view/home_page.dart';
import 'package:chat_app/view/sign_in/sign_in.dart';
import 'package:chat_app/view/sign_in/sign_in_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginGoogle() async{
    ISignInAccount signInGoogle = SignInGoogle();
    signInGoogle.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login", style: TextStyle(fontSize: 25,),),
            const SizedBox(height: 25,),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25,),

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password",border: OutlineInputBorder(),),
            ),
            const SizedBox(height: 25,),

            ElevatedButton(
              onPressed: () {
                if(emailController.text.isEmpty || passwordController.text.isEmpty){
                  Get.snackbar("Erro!", "Preencha todos os campos!",backgroundColor: Colors.red, );
                }else{
                  Get.snackbar("Sucesso!", "Usuário Logado :)",backgroundColor: Colors.green, );
                  Get.to(() => const HomePage());
                }
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(200),
                  padding: const EdgeInsets.symmetric(vertical: 20)),
              child: const Text("Sign in"),
            ),
            const SizedBox(height: 25,),
            const Text("Entre com: "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => loginGoogle, icon: const FaIcon(FontAwesomeIcons.google))
              ],
            )
          ],
        ),
      ),
    );
  }
}
