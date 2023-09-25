import 'package:chat_app/controllers/user_controller.dart';
import 'package:chat_app/database/dbFirestore.dart';
import 'package:chat_app/model/mensage.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MessageController extends GetxController{
  FirebaseFirestore _firestore =  FirebaseFirestore.instance;
  
  void setData(Mensage mensagem){
    _firestore.collection("message")..add(mensagem.toMap());
  }

  List<Map<String, dynamic>> isTalk(List<DocumentSnapshot> map, String idUser){
    
    List<Map<String, dynamic>> listMessages = [];

    map.forEach((doc) { 
      final data = doc.data()! as Map<String,dynamic>;
      if((data["fromUser"] == AuthService.to.user!.uid && data["toUser"] == idUser) || (data["toUser"] == AuthService.to.user!.uid && data["fromUser"] == idUser)){       
          listMessages.add(data);      
      }
    });

    return listMessages;
  }

  static MessageController get to => Get.find<MessageController>(); 

}