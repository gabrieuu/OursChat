import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view/home_page/tiles/person_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListFriends extends StatelessWidget {
  const ListFriends ({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").doc(AuthService.to.user!.email).collection(doc.friends.name).snapshots(), 
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none:
            case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                    UserProfile userProfile = UserProfile.fromMap(data);
                return PersonChat(user: userProfile,);
              })
              .toList()
              .cast(),
        );
        }
      },),
      const Text("segunda tela"),
      const Text("Terceira Tela")
    ]);
  }
}