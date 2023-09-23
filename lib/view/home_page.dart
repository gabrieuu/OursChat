import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view/tiles/person_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  UserProfile? user;



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appbar(),
        body: _body(),
        floatingActionButton: FloatingActionButton(onPressed: (){
          showModalBottomSheet(context: context, builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const Text("Search your Friend", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "email"
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () => UserController.to.getUserByEmail(email.text), child: const Text("Search")),
                  Obx(() => (UserController.to.userProfile.value != null) 
                  ? ListTile(
                    onTap: (){
                      showDialog(context: context, builder: (_) {
                        return AlertDialog(
                          title: Text("Deseja adicionar ${UserController.to.userProfile.value!.userName} na sua lista de amigos?",style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                          actions: [
                            TextButton(onPressed: (){}, child: Text("Add"))
                          ],
                        );
                      },);
                    },
                    onLongPress: (){},
                    leading: ClipOval(child: Image.asset('assets/images/gatinho.jpg', width: 45, height: 45,),),
                    title: Text(UserController.to.userProfile.value!.userName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                    subtitle: Text(UserController.to.userProfile.value!.id, style: TextStyle(fontSize: 12),),
                  ) 
                  : Center(child: Text("vazio"),)) 
                ],
              ),
            );
          },);
        }, elevation: 2,child: Icon(Icons.message)),
      ),
    );
  }

  _appbar(){
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("OursChat",style: TextStyle(fontWeight: FontWeight.bold),),
      elevation: 0,
      bottom: TabBar(
        tabs: <Widget>[
          Text("CHAT"),
          Text("STATUS"),
          Text("CALLS"),
        ],
        labelPadding: EdgeInsets.symmetric(vertical: 10),
        indicatorColor: Colors.green[900],
        ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.search,), splashRadius: 20, ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
              onTap: AuthService.to.logOut,
              child: const ListTile(title: Text("Log Out"),)
            ),
            PopupMenuItem(
              onTap: setUsername,
              child: const ListTile(title: Text("Set Username"),)
            ),
          ]         
        ,)
      ],
      //backgroundColor: Colors.white,
    );
  }
  _body(){
    return TabBarView(
      children: [
      ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return PersonChat();
        },
      ),
      Text("segunda tela"),
      Text("Terceira Tela")
    ]);
  }
  setUsername(){
    showModalBottomSheet(context: context, builder: (context) {
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
                    UserController.updateUsername(username.text);
                    Navigator.pop(context);
                  }, child: const Text("Change")),
                ],
              ),
            );
          },);
  }
}