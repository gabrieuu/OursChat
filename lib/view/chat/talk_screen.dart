import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({super.key});

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
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            padding: EdgeInsets.only(bottom: 80),
            itemCount: documents.length,
            reverse: true,
            itemBuilder: (context, index) {
              final data = documents[index].data()! as Map<String,dynamic>;
              return ListTile(
                title: Text(data["text"]),
              );
          },);
      }
    },);
  }
}
