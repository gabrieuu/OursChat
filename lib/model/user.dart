class UserProfile {
  final String userName;
  final String id;

  UserProfile({required this.userName, required this.id});

  static UserProfile fromMap(Map<dynamic, dynamic> map) {
    return UserProfile(
      userName: map["username"],
      id: map["id"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "username" : userName,
      "id" : id
    };
  }
}
