class UserProfile {
  final String email;
  final String password;
  final String userName;
  final int id;
  List<UserProfile> friends = [];

  UserProfile({
    required this.email,
    required this.password,
    required this.userName,
    required this.id,
  });

}
