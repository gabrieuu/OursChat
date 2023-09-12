import 'package:chat_app/controllers/message_controllers.dart';
import 'package:chat_app/view/chat/talk_screen.dart';
import 'package:chat_app/view/chat/text_bar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  MessageController messageController = MessageController();

  _sendMessage(text){
    messageController.setData(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
        leading: BackButton(),
        elevation: 1,
      ),
      bottomSheet: TextBar(
        sendmessage: _sendMessage,
      ),
      body: TalkScreen(),
    );
  }
}