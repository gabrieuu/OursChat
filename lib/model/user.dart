class UserProfile {
  final String email;
  final String userName;
  final String id;
  List<UserProfile> friends = [];

  UserProfile({
    required this.userName,
    required this.id,
    required this.email
  });

}
