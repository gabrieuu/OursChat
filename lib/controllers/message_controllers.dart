import 'package:chat_app/model/mensage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageController{
  FirebaseFirestore _firestore =  FirebaseFirestore.instance;
  
  void setData(Mensage mensagem){
    _firestore.collection("message").add(mensagem.toMap());
  }

}