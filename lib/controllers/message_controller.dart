import 'package:chat_app/database/dbFirestore.dart';
import 'package:chat_app/model/mensage.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/util/data_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MessageController extends GetxController{
  FirebaseFirestore firestore =  DBFirestore.get();
  var listMessages = [{}].obs;
  
  var message = FirebaseFirestore.instance.collection("message");

  @override
  void onInit() {
    super.onInit();

    if(AuthService.to.user != null){
      firestore.collection("message").orderBy("date").snapshots().listen((query) {
      listMessages.value = [{}];
      for (var doc in query.docs) {
        listMessages.add(doc.data());
       }
    });

    }   
  }


  void setData(Mensage mensagem){
    firestore.collection("message").add(mensagem.toMap());
  }

  List<Map<String, dynamic>> isTalk(List<DocumentSnapshot> map, String idUser){
    
    List<Map<String, dynamic>> listMessages = [];

    for (var doc in map) { 
      final data = doc.data()! as Map<String,dynamic>;
      if((data["fromUser"] == AuthService.to.user!.uid && data["toUser"] == idUser) || (data["toUser"] == AuthService.to.user!.uid && data["fromUser"] == idUser)){       
          listMessages.add(data); 
               
      }
    }
    return listMessages.reversed.toList();
  }

  Map<String, dynamic> lastMessage(String idUser){
    List<Map<String,dynamic>> ultimaMensagem = [{
      "message" : "",
      "date" : ""
    }];

    for (var data in listMessages) {
      if((data["fromUser"] == AuthService.to.user!.uid && data["toUser"] == idUser) || (data["toUser"] == AuthService.to.user!.uid && data["fromUser"] == idUser)){       
          ultimaMensagem.add({
            "message": data["message"],
            "date" : formatHours(data["date"]),
          });               
      }
    }
    
    return ultimaMensagem.last;
  }
  static MessageController get to => Get.find<MessageController>(); 

}