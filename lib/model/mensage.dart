import 'package:cloud_firestore/cloud_firestore.dart';

class Mensage {
  final String mensage;
  final Timestamp date;
  final String fromUser;
  final String toUser;

  Mensage({
    required this.mensage,
    required this.date,
    required this.fromUser,
    required this.toUser,
  });

  Map<String, dynamic> toMap (){
    return {
      "message" : mensage,
      "date" : date,
      "fromUser" : fromUser,
      "toUser" : toUser
    };
  }

}
