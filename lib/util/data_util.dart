import 'package:cloud_firestore/cloud_firestore.dart';

String formatData(Timestamp time){
  DateTime dateTime = time.toDate();
  final year = dateTime.year;
  final month = dateTime.month;
  final day = dateTime.day;

  return "$day/$month/$year";
}

String formatHours(Timestamp time){
  DateTime dateTime = time.toDate();

  if(dateTime.minute < 10){
    return "${dateTime.hour}:0${dateTime.minute}";
  }
    return "${dateTime.hour}:${dateTime.minute}";
  
}
