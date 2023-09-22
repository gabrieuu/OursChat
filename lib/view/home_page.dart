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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appbar(),
        body: _body(),
        floatingActionButton: FloatingActionButton(onPressed: (){
          showModalBottomSheet(context: context, builder: (context) {
            return Text("ss");
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
              child: const ListTile(title: Text("Log Out"),))
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
}