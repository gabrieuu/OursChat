import 'package:chat_app/database/dbFirestore.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

enum doc{friends, id, username}

const userCollection = "users";
class UserController extends GetxController{
  
  Rx<UserProfile?> userProfile = Rx<UserProfile?>(null); 
  final FirebaseFirestore _firestore = DBFirestore.get();
  RxList<UserProfile> listFriends = RxList<UserProfile>([]);
  var isLoading = false.obs;

  @override
  void onInit() async{
    super.onInit();
    
    await getFriends();

  }

   Future<void> saveUsers() async{
    FirebaseFirestore db = await DBFirestore.get();
    db.collection(userCollection).doc(AuthService.to.user!.email!).set({
      doc.username.name : AuthService.to.user!.email!,
      doc.id.name : AuthService.to.user!.uid
    });
  }

   updateUsername(String newUsername) async{
    FirebaseFirestore db = await DBFirestore.get();
    db.collection(userCollection).doc(AuthService.to.user!.email!).update({
      doc.username.name : newUsername
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
    db.collection(userCollection).doc(AuthService.to.user!.email!).collection("friends").add({
      doc.username.name : user.userName,
      doc.id.name : user.id,
    });
    await getFriends();
  }

  Future<void> getFriends() async{
    _firestore.collection("users").doc(AuthService.to.user!.email).collection("friends").snapshots().listen((query){
          listFriends.clear();
          for (var doc in query.docs) {
            listFriends.add(UserProfile.fromMap(doc.data()));
          }
    });
  }

  static UserController get to => Get.find<UserController>();

}