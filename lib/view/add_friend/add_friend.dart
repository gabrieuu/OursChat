import 'package:chat_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFriend extends StatelessWidget {
  AddFriend({super.key});


  TextEditingController email = TextEditingController();

  final userConttroller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const Text("Search your Friend", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "email"
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () => userConttroller.getUserByEmail(email.text), child: const Text("Search")),
                  Obx(() => (userConttroller.userProfile.value != null) 
                  ? ListTile(
                    onTap: (){
                      showDialog(context: context, builder: (_) {
                        return AlertDialog(
                          title: Text("Deseja adicionar ${userConttroller.userProfile.value!.userName} na sua lista de amigos?",style: const TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                          actions: [
                            TextButton(onPressed: (){
                              userConttroller.adicionarAmigo(userConttroller.userProfile.value!);
                              userConttroller.userProfile.value = null;
                              Navigator.pop(context);
                            }, child: const Text("Add"))
                          ],
                        );
                      },);
                    },
                    onLongPress: (){},
                    leading: ClipOval(child: Image.asset('assets/images/gatinho.jpg', width: 45, height: 45,),),
                    title: Text(userConttroller.userProfile.value!.userName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                    subtitle: Text(userConttroller.userProfile.value!.id, style: const TextStyle(fontSize: 12),),
                  ) 
                  : const Center(child: Text("vazio"),)) 
                ],
              ),
            );
  }
}