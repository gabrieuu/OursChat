import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DBFirestore._();

  static final DBFirestore _instance = DBFirestore._();


  static get(){
    return DBFirestore._instance._firestore;
  }
}