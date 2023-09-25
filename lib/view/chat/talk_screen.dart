import 'package:chat_app/controllers/message_controllers.dart';
import 'package:chat_app/controllers/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TalkScreen extends StatefulWidget {
  TalkScreen({super.key, required this.idUserToTalk});

  String idUserToTalk;

  @override
  State<TalkScreen> createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("message").snapshots(), 
      builder: (context, snapshot) {
      switch(snapshot.connectionState){
        case ConnectionState.none:
          case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator(),);
        default:
          final documents = MessageController.to.isTalk(snapshot.data!.docs, widget.idUserToTalk);
          return (documents.isNotEmpty) 
          ? ListView.builder(           
            padding: EdgeInsets.only(bottom: 80),
            itemCount: documents.length,
            reverse: true,
            itemBuilder: (context, index) {
              final data = documents[index];
                  return Container(
                    alignment: Alignment.centerRight,
                    child: ListTile(
                      title: Text(data["message"]),
                    ),
                  );
              
          },) 
          : Center(child: Text("Inicie uma conversa"),);
      }
    },);
  }
}
