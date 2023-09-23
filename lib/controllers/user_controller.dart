import 'package:chat_app/database/dbFirestore.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

const userCollection = "users";
class UserController extends GetxController{
  
  Rx<UserProfile?> userProfile = Rx<UserProfile?>(null); 

  static Future<void> saveUsers() async{
    FirebaseFirestore db = await DBFirestore.get();
    db.collection(userCollection).doc(AuthService.to.user!.email!).set({
      "username": AuthService.to.user!.email!,
      "id":AuthService.to.user!.uid
    });
  }

  static updateUsername(String newUsername) async{
    FirebaseFirestore db = await DBFirestore.get();
    db.collection(userCollection).doc(AuthService.to.user!.email!).update({
      "username" : newUsername
    });
  }

  getUserByEmail(String userEmail) async{
    FirebaseFirestore db = await DBFirestore.get();
    var docRef = db.collection(userCollection).doc(userEmail);
    docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      userProfile.value = UserProfile.fromMap(data);
    });
  }

  adicionarAmigo(UserProfile user) async{
    FirebaseFirestore db = await DBFirestore.get();
    db.collection(userCollection).doc(AuthService.to.user!.email!).;
  }

  static UserController get to => Get.find<UserController>();

}