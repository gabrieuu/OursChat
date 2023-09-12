import 'package:chat_app/view/tiles/person_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      ),
    );
  }

  _appbar(){
    return AppBar(
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
        IconButton(onPressed: (){}, icon: Icon(Icons.search,), splashRadius: 20, ),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,),splashRadius: 20)
      ],
      //backgroundColor: Colors.white,
    );
  }
  _body(){
    return TabBarView(children: [
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