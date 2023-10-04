import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view/add_friend/add_friend.dart';
import 'package:chat_app/view/home_page/chat_settings.dart';
import 'package:chat_app/view/home_page/list_friends.dart';
import 'package:chat_app/view/home_page/search_widget.dart';
import 'package:chat_app/view/home_page/set_username.dart';
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
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Obx(() => (UserController.to.listFriends.isNotEmpty) 
              ? Column(
                children: [
                  SearchWidget(),
                  Expanded(
                    child: ListFriends(),
                    ),
                ],
              ) 
              : Center(child: CircularProgressIndicator(),)
            ),
            ChatSettings()
          ]
          ,),
        bottomNavigationBar: TabBar(        
        tabs: const <Widget>[
          Tab(
            icon: Icon(Icons.house),
            text: "Chats",
            iconMargin: EdgeInsets.only(bottom: 5),
            height: 50,
          ),
          Tab(
            icon: Icon(Icons.settings),
            text: "Settings",
            iconMargin: EdgeInsets.only(bottom: 5),
            height: 50,
          )
        ],
        labelPadding: const EdgeInsets.symmetric(vertical: 10),
        indicatorColor: Colors.green[900],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddFriend();
              },
            );
          },
          elevation: 2,          
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}
