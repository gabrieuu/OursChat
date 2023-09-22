import 'package:chat_app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  
  FirebaseFirestore db = FirebaseFirestore.instance;
  final logado = false.obs;


  void saveUsers(UserProfile user) async{
    
    db.collection("users").doc(user.email).get().then((docSnapshot) {
      if(!docSnapshot.exists){
        db.collection("users").doc(user.email).set({
          "id" : user.id,
          "username" : user.userName,
          "friends" : user.friends
        });
      }
    }).catchError(() => print("erro"));
  }


}