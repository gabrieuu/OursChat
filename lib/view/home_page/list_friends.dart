import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/view/home_page/tiles/person_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListFriends extends StatelessWidget {
  const ListFriends ({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
      ListView.builder(
        itemCount: UserController.to.listFriends.length,
        itemBuilder: (_, index) {
          return Obx(() => PersonChat(user: UserProfile.fromMap(UserController.to.listFriends[index])));
        },
        ),
      const Text("segunda tela"),
      const Text("Terceira Tela")
    ]);
  }
}