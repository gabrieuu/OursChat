import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageController extends ChangeNotifier{
  FirebaseFirestore _firestore =  FirebaseFirestore.instance;
  
  void setData(String message){
    _firestore.collection("message").add({
      "text" : message
    });
  }

}