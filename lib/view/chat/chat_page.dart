import 'package:chat_app/controllers/message_controllers.dart';
import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/model/mensage.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view/chat/talk_screen.dart';
import 'package:chat_app/view/chat/text_bar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.user});
  
  UserProfile user;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  MessageController messageController = MessageController();
  // falta id usuário atual
  
  _sendMessage(text){ 
    final mensagem = Mensage(mensage: text, date: DateTime.now(), fromUser: AuthService.to.user!.uid, toUser: widget.user.id);
    messageController.setData(mensagem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.userName),
        leading: BackButton(),
        elevation: 1,
      ),
      bottomSheet: TextBar(
        sendmessage: _sendMessage,
      ),
      body: TalkScreen(idUserToTalk: widget.user.id),
    );
  }
}