import 'package:chat_app/controllers/message_controllers.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TalkScreen extends StatelessWidget {
  TalkScreen({super.key, required this.idUserToTalk});

  String idUserToTalk;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("message").orderBy('date').snapshots(), 
      builder: (context, snapshot) {
      switch(snapshot.connectionState){
        case ConnectionState.none:
          case ConnectionState.waiting:
          return const Center(child: CircularProgressIndicator(),);
        default:
          final documents = MessageController.to.isTalk(snapshot.data!.docs, idUserToTalk);
          return (documents.isNotEmpty) 
          ? ListView.builder(           
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: documents.length,
            reverse: true,
            itemBuilder: (context, index) {
              final data = documents[index];
                  return Container(
                     padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                      child: Align(
                        alignment: (data["fromUser"] == AuthService.to.user!.uid) ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: (data["fromUser"] == AuthService.to.user!.uid) ? Colors.grey.shade200:Colors.blue[200],
                            borderRadius: BorderRadius.circular(10),                     
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(data["message"], style: TextStyle(color: (data["fromUser"] == AuthService.to.user!.uid) ? Colors.black : Colors.black),),
                        ),
                      ),                    
                      
                    );
              
          },) 
          : const Center(child: Text("Inicie uma conversa"),);
      }
    },);
}
}
