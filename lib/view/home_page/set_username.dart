import 'package:chat_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class SetUsername extends StatelessWidget {
  const SetUsername({super.key});

  @override
  Widget build(BuildContext context) {
    
    TextEditingController username = TextEditingController();

    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const Text("Alterar Username", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    UserController.to.updateUsername(username.text);
                    Navigator.pop(context);
                  }, child: const Text("Change")),
                ],
              ),
            );
  }
}