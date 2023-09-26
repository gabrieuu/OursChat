import 'package:chat_app/controllers/message_controllers.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/view/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonChat extends StatelessWidget {
  PersonChat({super.key, required this.user});

  UserProfile user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(user: user),
            ));
      },
      onLongPress: () {
        print("${MessageController.to.listMessages}");
      },
      leading: ClipOval(
        child: Image.asset(
          'assets/images/gatinho.jpg',
          width: 45,
          height: 45,
        ),
      ),
      title: Text(
        user.userName,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Text(MessageController.to.lastMessage(user.id)["message"])),
          Row(
            children: [
              const Icon(Icons.check,),
              const SizedBox(width: 10,),
              Obx(() => Text(MessageController.to.lastMessage(user.id)["date"])),
            ],
          )

        ],
      ),
    );
  }
}
