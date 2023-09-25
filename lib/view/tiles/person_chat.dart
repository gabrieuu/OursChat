import 'package:chat_app/model/user.dart';
import 'package:chat_app/view/chat/chat_page.dart';
import 'package:flutter/material.dart';

class PersonChat extends StatefulWidget {
  PersonChat({super.key, required this.user});

  UserProfile user; 

  @override
  State<PersonChat> createState() => _PersonChatState();
}

class _PersonChatState extends State<PersonChat> {

 

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(user: user),));
      },
      onLongPress: (){},
      leading: ClipOval(child: Image.asset('assets/images/gatinho.jpg', width: 45, height: 45,),),
      title: Text(user.userName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
      subtitle: Text("last message", style: TextStyle(fontSize: 12),),
    );
  }
}