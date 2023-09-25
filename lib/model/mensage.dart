class Mensage {
  final String mensage;
  final DateTime date;
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
      "date" : date.toIso8601String(),
      "fromUser" : fromUser,
      "toUser" : toUser
    };
  }

}
