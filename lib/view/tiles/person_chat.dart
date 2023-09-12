import 'package:chat_app/view/chat/chat_page.dart';
import 'package:flutter/material.dart';

class PersonChat extends StatefulWidget {
  const PersonChat({super.key});

  @override
  State<PersonChat> createState() => _PersonChatState();
}

class _PersonChatState extends State<PersonChat> {

 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage(),));
      },
      onLongPress: (){},
      leading: ClipOval(child: Image.asset('assets/images/gatinho.jpg', width: 45, height: 45,),),
      title: Text("Martin Randolph", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
      subtitle: Text("last message", style: TextStyle(fontSize: 12),),
    );
  }
}